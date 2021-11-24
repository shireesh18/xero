import Foundation

public class InvoiceLine {
    
    var invoiceLineId: Int
    var description: String
    var quantity: Int
    var cost: Double
    
    init(invoiceLineId: Int, description: String, quantity: Int, cost: Double) {
        self.invoiceLineId = invoiceLineId
        self.description = description
        self.quantity = quantity
        self.cost = cost
    }
}
