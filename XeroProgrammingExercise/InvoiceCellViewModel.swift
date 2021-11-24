//
//  InvoiceViewModel.swift
//  XeroProgrammingExercise
//
//  Created by Shireesh Marla on 24/11/2021.
//  Copyright © 2021 Xero Ltd. All rights reserved.
//

import Foundation

struct InvoiceCellViewModel{
    let invoiceNumber: Int
    let invoiceDate: Date
    let invoiceLine: [InvoiceLine]
}
