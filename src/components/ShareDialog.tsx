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
}

export const ShareDialog = ({ 
  open, 
  onOpenChange, 
  billNumber, 
  customerPhone,
  total 
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

  const handleEmail = () => {
    const subject = encodeURIComponent(`Invoice ${billNumber}`);
    const body = encodeURIComponent(
      `Dear Customer,\n\nPlease find your invoice details below:\n\nInvoice Number: ${billNumber}\nTotal Amount: ₹${total.toFixed(2)}\n\nThank you for your business!`
    );
    window.location.href = `mailto:?subject=${subject}&body=${body}`;
    onOpenChange(false);
  };

  const handlePrint = () => {
    window.print();
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
            onClick={handleEmail}
            className="w-full justify-start gap-3"
            variant="outline"
            size="lg"
          >
            <Mail className="h-5 w-5 text-blue-600" />
            <span>Share via Email</span>
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
