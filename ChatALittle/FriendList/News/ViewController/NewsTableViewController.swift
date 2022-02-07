//
//  NewsTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 03.02.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsArray: [NewsModel] = [.init(newsPhotoImage: "1", newsText: "Эта какая-то очень интересная новость №1 и эта новость введена для проверки!и для проверки я сюда вставлю ещё енмного текса из интернета про страшный Омикрон: 100 процентная контагиозность. Если вы думаете, что вы не заболели вы просто не знаете об этом или заболеете в ближайшие дни 🥲 Кратко о ОМИКРОНЕ: ✅Чаще болеют молодые люди ✅ Болезнь протекает чаще всего в легкой или среднетяжёлый форме ( есть исключения) ✅ Прививка не спасает ( штамм мутировал)  ✅ Человек в день может заразить около 100 человек ✅ Смертность ниже ✅ Инкубационный период от нескольких часов до 3 дней. Как проявляется? Как ОРВИ( боль в горле, заложенность носа, тошнота, диарея, головная боль, озноб) .У детей раннего возраста может проявиться ложным крупом ( дающим кашлем ). ", numbersOfViews: 0),
                                  .init(newsPhotoImage: "2", newsText: "Эта какая-то очень интересная новость №2 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "3", newsText: "Эта какая-то очень интересная новость №3 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "4", newsText: "Эта какая-то очень интересная новость №4 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "5", newsText: "Эта какая-то очень интересная новость №5 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "6", newsText: "Эта какая-то очень интересная новость №6 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "4", newsText: "Эта какая-то очень интересная новость №7 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "3", newsText: "Эта какая-то очень интересная новость №8 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "2", newsText: "Эта какая-то очень интересная новость №9 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "6", newsText: "Эта какая-то очень интересная новость №10 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "1", newsText: "Эта какая-то очень интересная новость №11 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "1", newsText: "Эта какая-то очень интересная новость №12 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "4", newsText: "Эта какая-то очень интересная новость №13 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "5", newsText: "Эта какая-то очень интересная новость №14 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "2", newsText: "Эта какая-то очень интересная новость №15 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "1", newsText: "Эта какая-то очень интересная новость №16 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "2", newsText: "Эта какая-то очень интересная новость №17 и эта новость введена для проверки", numbersOfViews: 0),
                                  .init(newsPhotoImage: "4", newsText: "Эта какая-то очень интересная новость №118 и эта новость введена для проверки", numbersOfViews: 0)]
    
    @IBOutlet var newsTableView: UITableView!
    
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        let backgroundView = UIView(frame: newsTableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: .zero)
        newsTableView.backgroundView = backgroundView
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        registerTableViewCells()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 550
        
    }

    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCellId", for: indexPath) as! NewsTableViewCell
        cell.setupUIImage(imageName: newsArray[indexPath.row].newsPhotoImage)
        cell.setupNewsTextLabel(newsText: newsArray[indexPath.row].newsText)
        let timeCounters = newsArray[indexPath.row].numbersOfViews + 1
        newsArray[indexPath.row].numbersOfViews = timeCounters
        cell.setupNumbersOfViews(number: String(timeCounters))
        return cell
    }
}

private extension NewsTableViewController {
    func registerTableViewCells() {
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: "NewsTableViewCellId")
    }
}
