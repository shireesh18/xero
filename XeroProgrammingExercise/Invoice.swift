import Foundation

public class Invoice {
    
    var invoiceNumber: Int
    var invoiceDate: Date
    var lineItems : [InvoiceLine]
    
    init(_ invoiceNumber:Int,_ invoiceDate :Date, _ lineItems : [InvoiceLine]) {
        self.invoiceNumber = invoiceNumber
        self.invoiceDate = invoiceDate
        self.lineItems = lineItems
   }
    
    func addInvoiceLine(_ line: InvoiceLine) {
        lineItems.append(line)
    }
    
    func removeInvoiceLine(with SOMEID: Int) {
        //TODO need to implement
        self.lineItems = lineItems.filter {$0.invoiceLineId != SOMEID}
    }
    
    /// GetTotal should return the sum of (Cost * Quantity) for each line item
    func getTotal() -> Decimal {
        //TODO need to implement
        var total = 0.0
         for item in lineItems {
            total += Double(item.quantity) * item.cost
        }
        return Decimal(total)
    }
    
    /// MergeInvoices appends the items from the sourceInvoice to the current invoice
    func mergeInvoices(sourceInvoice: Invoice) {
       lineItems.append(contentsOf: sourceInvoice.lineItems)
    }
    
    /// Creates a deep clone of the current invoice (all fields and properties)
    func clone() -> Invoice {
        //TODO need to implement
        return Invoice(self.invoiceNumber, self.invoiceDate, self.lineItems)
    }
    
    /// order the lineItems by Id
    func oderLineItems() {
        //TODO need to implement
        lineItems.sort { (line1, line2) -> Bool in
            line1.invoiceLineId < line2.invoiceLineId
        }
    }
    
    /// returns the number of the line items specified in the variable `max`
    func previewLineItems(_ max: Int) -> [InvoiceLine] {
        //TODO need to implement
        return max < lineItems.count ? Array(lineItems.prefix(max)) : lineItems
    }
    
    /// remove the line items in the current invoice that are also in the sourceInvoice
    func removeItems(from sourceInvoice: Invoice) {
        //TODO need to implement
        lineItems = lineItems.filter{$0.description != sourceInvoice.lineItems.description}
    }
    
    /// Outputs string containing the following (replace [] with actual values):
    /// Invoice Number: [InvoiceNumber], InvoiceDate: [DD/MM/YYYY], LineItemCount: [Number of items in LineItems]
    func toString() -> String {
        //TODO need to implement
        return "Invoice Number: \(invoiceNumber), InvoiceDate: \(convertDateToDD_MM_YYYY(invoiceDate)), LineItemCount: \(lineItems.count)"
    }
    
    func convertDateToDD_MM_YYYY(_ date : Date)-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.timeZone = TimeZone(abbreviation: "UTC")

        return formatter.string(from: date as Date)
    }
 
}



