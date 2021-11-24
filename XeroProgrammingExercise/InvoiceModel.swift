//
//  InvoiceModel.swift
//  XeroProgrammingExercise
//
//  Created by Shireesh Marla on 24/11/2021.
//  Copyright © 2021 Xero Ltd. All rights reserved.
//

import Foundation

struct InvoiceModel {
     func getInvoices() -> [Invoice] {
            let invoice1 = Invoice(1, Date.init(), [InvoiceLine]())
            
            invoice1.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                                description: "Banana",
                                                quantity: 4,
                                                cost: 10.33))
            
            let invoice2 = Invoice(2, Date.init(), [InvoiceLine]())
            
            invoice2.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                                description: "Orange",
                                                quantity: 1,
                                                cost: 5.22))
            
            invoice2.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                                description: "Blueberries",
                                                quantity: 3,
                                                cost: 6.27))
            
            let invoice3 = Invoice(3, Date.init(), [InvoiceLine]())
            
            invoice3.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                                description: "Pizza",
                                                quantity: 1,
                                                cost: 9.99))
            
            return [invoice1, invoice2, invoice3]
        }
    
     func removeExtraItems() {
        let invoice1 = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice1.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                            description: "Banana",
                                            quantity: 4,
                                            cost: 10.33))
        
        invoice1.addInvoiceLine(InvoiceLine(invoiceLineId: 3,
                                            description: "Blueberries",
                                            quantity: 3,
                                            cost: 6.27))
        
        let invoice2 = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice2.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                            description: "Orange",
                                            quantity: 1,
                                            cost: 5.22))
        
        invoice2.addInvoiceLine(InvoiceLine(invoiceLineId: 3,
                                            description: "Blueberries",
                                            quantity: 3,
                                            cost: 6.27))
        
        invoice2.removeItems(from: invoice1)
        print(invoice2.getTotal())
    }
    
    func previewLineItems() {
        let invoice = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Banana",
                                           quantity: 4,
                                           cost: 10.21))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                           description: "Orange",
                                           quantity: 1,
                                           cost: 5.21))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 3,
                                           description: "Pizza",
                                           quantity: 5,
                                           cost: 5.21))
        
        let items = invoice.previewLineItems(1)
        print(items)
    }
    
    func orderLineItems() {
        let invoice = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 3,
                                           description: "Banana",
                                           quantity: 4,
                                           cost: 10.21))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                           description: "Orange",
                                           quantity: 1,
                                           cost: 5.21))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Pizza",
                                           quantity: 5,
                                           cost: 5.21))
        
        invoice.oderLineItems()
        print(invoice.toString())
    }
    
    func InvoiceToString() {
        let invoice = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Apple",
                                           quantity: 1,
                                           cost: 6.99))
        
        print(invoice.toString())
    }
    
    func cloneInvoice() {
        let invoice = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Apple",
                                           quantity: 1,
                                           cost: 6.99)
        )
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                           description: "Blueberries",
                                           quantity: 3,
                                           cost: 6.27))
        
        let clonedInvoice = invoice.clone()
        print(clonedInvoice.getTotal())
    }
    
    func mergeInvoices() {
        let invoice1 = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice1.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                            description: "Banana",
                                            quantity: 4,
                                            cost: 10.33))
        
        let invoice2 = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice2.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                            description: "Orange",
                                            quantity: 1,
                                            cost: 5.22))
        
        invoice2.addInvoiceLine(InvoiceLine(invoiceLineId: 3,
                                            description: "Blueberries",
                                            quantity: 3,
                                            cost: 6.27))
        
        invoice1.mergeInvoices(sourceInvoice: invoice2)
        print(invoice1.getTotal())
        
    }
    
    func removeItem() {
        let invoice = Invoice(Int.random(in: 0...100), Date.init(), [InvoiceLine]())
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Orange",
                                           quantity: 1,
                                           cost: 5.22))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                           description: "Banana",
                                           quantity: 4,
                                           cost: 10.33))
        
        invoice.removeInvoiceLine(with: 1)
        print(invoice.getTotal())
    }
    
    func createInvoiceWithMultipleItemsAndQuantities() {
        let invoice = Invoice(1, Date.init(), [InvoiceLine]())
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Banana",
                                           quantity: 4,
                                           cost: 10.21))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 2,
                                           description: "Orange",
                                           quantity: 1,
                                           cost: 5.21))
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 3,
                                           description: "Pizza",
                                           quantity: 5,
                                           cost: 5.21))
        
        print(invoice.getTotal())
    }
    
    func createInvoiceWithOneItem() {
        let invoice = Invoice(1, Date.init(), [InvoiceLine]())
        
        invoice.addInvoiceLine(InvoiceLine(invoiceLineId: 1,
                                           description: "Pizza",
                                           quantity: 1,
                                           cost: 9.99))
    }
}
