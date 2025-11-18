import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Share2, Mail, Printer } from "lucide-react";
import { toast } from "sonner";

interface ShareDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  billNumber: string;
  customerPhone: string;
  total: number;
  pdfDataUrl?: string;
}

export const ShareDialog = ({ 
  open, 
  onOpenChange, 
  billNumber, 
  customerPhone,
  total,
  pdfDataUrl
}: ShareDialogProps) => {
  
  const handleWhatsApp = () => {
    if (!customerPhone) {
      toast.error("No customer phone number available");
      return;
    }
    
    const message = encodeURIComponent(
      `Invoice ${billNumber}\nTotal: ₹${total.toFixed(2)}\n\nThank you for your business!`
    );
    const whatsappUrl = `https://wa.me/${customerPhone.replace(/\D/g, '')}?text=${message}`;
    window.open(whatsappUrl, '_blank');
    onOpenChange(false);
  };

  const handleGmail = async () => {
    const subject = encodeURIComponent(`Invoice ${billNumber}`);
    const bodyText = `Dear Customer,\n\nPlease find your invoice details below:\n\nInvoice Number: ${billNumber}\nTotal Amount: ₹${total.toFixed(2)}\n\nThank you for your business!`;

    if (!pdfDataUrl) {
      // Fallback: open Gmail compose (cannot auto-attach via URL)
      const body = encodeURIComponent(bodyText);
      window.open(`https://mail.google.com/mail/?view=cm&fs=1&su=${subject}&body=${body}`, '_blank');
      onOpenChange(false);
      return;
    }

    const to = window.prompt('Enter recipient email');
    if (!to) return;

    try {
      const base64 = pdfDataUrl.includes(',') ? pdfDataUrl.split(',')[1] : pdfDataUrl;
      const resp = await fetch(`https://dcfwnbezcieqpcenwfbp.functions.supabase.co/send-invoice`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          to,
          subject: `Invoice ${billNumber}`,
          body: bodyText,
          filename: `${billNumber}.pdf`,
          pdfBase64: base64,
        })
      });
      if (!resp.ok) throw new Error('Failed to send email');
      toast.success('Email sent with PDF attached');
      onOpenChange(false);
    } catch (e: any) {
      console.error(e);
      toast.error(e.message || 'Failed to send email');
    }
  };

  const handlePrint = () => {
    if (pdfDataUrl) {
      window.open(pdfDataUrl, '_blank');
    } else {
      window.print();
    }
    onOpenChange(false);
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle>Share Invoice</DialogTitle>
        </DialogHeader>
        <div className="flex flex-col gap-3 py-4">
          <Button
            onClick={handleWhatsApp}
            className="w-full justify-start gap-3"
            variant="outline"
            size="lg"
          >
            <Share2 className="h-5 w-5 text-green-600" />
            <span>Share via WhatsApp</span>
          </Button>
          
          <Button
            onClick={handleGmail}
            className="w-full justify-start gap-3"
            variant="outline"
            size="lg"
          >
            <Mail className="h-5 w-5 text-blue-600" />
            <span>Share via Gmail</span>
          </Button>
          
          <Button
            onClick={handlePrint}
            className="w-full justify-start gap-3"
            variant="outline"
            size="lg"
          >
            <Printer className="h-5 w-5 text-gray-600" />
            <span>Print Invoice</span>
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  );
};
