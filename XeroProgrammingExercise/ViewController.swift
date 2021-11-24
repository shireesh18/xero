/*
 Welcome to the Xero technical excercise!
 ---------------------------------------------------------------------------------
 The test consists of a small invoice application that has a number of issues.
 
 Your job is to fix them and make sure you can perform the functions in each method below and display the list of invoices from getInvoices() inside a UITableView.
 
 Note your first job is to get the solution compiling!
 
 Rules
 ---------------------------------------------------------------------------------
 * The entire solution must be written in Swift (UIKit or SwiftUI)
 * You can modify any of the code in this solution, split out classes, add projects etc
 * You can modify Invoice and InvoiceLine, rename and add methods, change property types (hint)
 * Feel free to use any libraries or frameworks you like
 * Feel free to write tests (hint)
 * Show off your skills!
 
 Good luck :)
 
 When you have finished the solution please zip it up and email it back to the recruiter or developer who sent it to you
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let model = InvoiceModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createInvoiceWithOneItem()
        createInvoiceWithMultipleItemsAndQuantities()
        removeItem()
        mergeInvoices()
        cloneInvoice()
        orderLineItems()
        previewLineItems()
        removeExtraItems()
        InvoiceToString()
        
        setupTableView()
        reloadTableViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadTableViewData()
    }
    
    private func createInvoiceWithOneItem() {
        model.createInvoiceWithOneItem()
    }
    
    private  func createInvoiceWithMultipleItemsAndQuantities() {
        model.createInvoiceWithMultipleItemsAndQuantities()
    }
    
    private func removeItem() {
        model.removeItem()
    }
    
    private func mergeInvoices() {
        model.mergeInvoices()
    }
    
    private func cloneInvoice() {
        model.cloneInvoice()
    }
    
    private func InvoiceToString() {
        model.InvoiceToString()
    }
    
    func orderLineItems() {
        model.orderLineItems()
    }
    
    private func previewLineItems() {
        model.previewLineItems()
    }
    
    private func removeExtraItems() {
        model.removeExtraItems()
    }
    
    ///Initialises the tableview
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "InvoiceTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InvoiceTableViewCell")
        tableView.rowHeight = 300
        tableView.estimatedRowHeight = 400
    }
    
    ///Populates the cells with the invoices returned from GetInvoices
    func reloadTableViewData() {
        tableView.reloadData()
    }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getInvoices().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvoiceTableViewCell", for: indexPath) as? InvoiceTableViewCell else {return UITableViewCell()}
        let vmodel = model.getInvoices()[indexPath.row]
        let viewModel = InvoiceCellViewModel(invoiceNumber: vmodel.invoiceNumber, invoiceDate: vmodel.invoiceDate, invoiceLine: vmodel.lineItems)
        cell.invoiceId.text = "\(viewModel.invoiceNumber)"
        cell.invoiceDate.text = "\(DateUtils.convertDateToDD_MM_YYYY(viewModel.invoiceDate))"
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        cell.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: cell.invoiceId.bottomAnchor, constant: 24).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.trailingAnchor,constant: 16).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.bottomAnchor,constant: 24).isActive = true
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 8
        verticalStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        let horizontalStackView = createHorizontalStackview("id", "Description", "Quantity", "Cost")
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.alignment = .center
        horizontalStackView.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 0).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 0).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor,constant: 0).isActive = true
        horizontalStackView.distribution = .fillEqually
        
        for i in 0...viewModel.invoiceLine.count-1 {
            let horStackView = createHorizontalStackview(
                "\(viewModel.invoiceLine[i].invoiceLineId)",
                "\(viewModel.invoiceLine[i].description)",
                "\(viewModel.invoiceLine[i].quantity)", "\(viewModel.invoiceLine[i].cost)"
            )
            verticalStackView.addArrangedSubview(horStackView)
            if(i == 0){
                horStackView.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 24).isActive = true
            }else{
                horStackView.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 24).isActive = true
            }
            horStackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 0).isActive = true
            horStackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor,constant: 0).isActive = true
            horStackView.alignment = .center
            horStackView.distribution = .fillEqually
            verticalStackView.layoutIfNeeded()
        }
//        cell.layoutIfNeeded()
        
        return cell
    }
    
    func createHorizontalStackview(_ invoiceLineId: String, _ description: String,
                                   _ quantitiy: String, _ cost:String) -> UIStackView{
        
        let horStackView  = UIStackView()
        horStackView.axis = .horizontal
        let lineIdLabel = UILabel()
        lineIdLabel.text = invoiceLineId
        lineIdLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        horStackView.addArrangedSubview(lineIdLabel)
        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        horStackView.addArrangedSubview(descriptionLabel)
        let quantityLabel = UILabel()
        quantityLabel.text = quantitiy
        quantityLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
       
        horStackView.addArrangedSubview(quantityLabel)
        let costLabel = UILabel()
        costLabel.text = cost
        costLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        horStackView.addArrangedSubview(costLabel)
        horStackView.distribution = .fillProportionally
        horStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return horStackView
        
    }
    
}


