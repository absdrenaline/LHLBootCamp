////  ViewController.swift
// Created: 2019-07-09
//


import UIKit


class MainViewController: UITableViewController {

    static let kTableHeaderHeight:CGFloat = 272
    static let kTableHeaderCutAway:CGFloat = 80
    
    
    @IBOutlet weak var headerView: UIView!
    
    var news = [NewsItem]()
    var colorMap = ["World":UIColor.red,
        "Europe":UIColor.green,
        "Middle":UIColor.yellow,
        "Africa":UIColor.orange,
        "Asia":UIColor.purple,
        "Americas":UIColor.blue]
    
    var headerMaskLayer:CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        news = [NewsItem(category:"World",headline: "Climate change protests, divestments meet fossil fuels realities."),
             NewsItem(category:"Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
             NewsItem(category:"Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
             NewsItem(category:"Africa",headline:"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
             NewsItem(category:"Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting"),
             NewsItem(category:"Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
             NewsItem(category:"World", headline: "South Africa in $40 billion deal for Russian nuclear reactors"),
             NewsItem(category:"Europe", headline: "'One million babies' created by EU student exchanges")
            ]
       tableView.tableHeaderView = nil
        //headerView = HeaderView(frame: CGRect(x: 0,y: 0,width: 414,height: 273))
        headerView.frame = CGRect(x: 0,y: 0,width: 414,height: 273)
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        tableView.contentInset.top = MainViewController.kTableHeaderHeight
        tableView.addSubview(headerView)
        tableView.setContentOffset(CGPoint(x: 0,y: -tableView.contentInset.top), animated: true)
        updateHeaderView()
        
    }
    
    func updateHeaderView() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerView.frame.width, y: 0))
        path.addLine(to: CGPoint(x: headerView.frame.width, y: headerView.frame.height))
        path.addLine(to: CGPoint(x: 0, y: headerView.frame.height -  MainViewController.kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
        
        if tableView.contentOffset.y < (-MainViewController.kTableHeaderHeight) {
            headerView.frame = CGRect(x:0,y:0,width: 414, height:tableView.contentOffset.y)
        } else {
            headerView.frame = CGRect(x:0,y:-tableView.contentInset.top,width: 414, height:MainViewController.kTableHeaderHeight)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemCell", for: indexPath) as! NewsTableViewCell
        cell.categoryLabel.text = news[indexPath.row].category
        cell.headlineLabel.text = news[indexPath.row].headline
        cell.categoryLabel.textColor = colorMap[news[indexPath.row].category]
        return cell
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}

