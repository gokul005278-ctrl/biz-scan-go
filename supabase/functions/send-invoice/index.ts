import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { Resend } from "npm:resend@4.0.0";

const resend = new Resend(Deno.env.get("RESEND_API_KEY") as string);

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

interface SendInvoiceRequest {
  to: string;
  subject: string;
  body: string;
  filename?: string;
  pdfBase64: string; // base64 without data URL prefix
}

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const { to, subject, body, filename = "invoice.pdf", pdfBase64 } = (await req.json()) as SendInvoiceRequest;

    if (!to || !pdfBase64) {
      return new Response(JSON.stringify({ error: "Missing 'to' or 'pdfBase64'" }), {
        status: 400,
        headers: { "Content-Type": "application/json", ...corsHeaders },
      });
    }

    const { data, error } = await resend.emails.send({
      from: "Billing <onboarding@resend.dev>",
      to: [to],
      subject,
      html: `<p>${body.replace(/\n/g, '<br/>')}</p>`,
      attachments: [
        {
          filename,
          content: pdfBase64,
        },
      ],
    });

    if (error) {
      console.error("Resend error:", error);
      return new Response(JSON.stringify({ error }), {
        status: 500,
        headers: { "Content-Type": "application/json", ...corsHeaders },
      });
    }

    return new Response(JSON.stringify({ ok: true, data }), {
      status: 200,
      headers: { "Content-Type": "application/json", ...corsHeaders },
    });
  } catch (e) {
    console.error(e);
    return new Response(JSON.stringify({ error: String(e) }), {
      status: 500,
      headers: { "Content-Type": "application/json", ...corsHeaders },
    });
  }
});
