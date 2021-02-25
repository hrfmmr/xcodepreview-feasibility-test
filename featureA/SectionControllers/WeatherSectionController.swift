/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

import IGListKit

class WeatherSectionController: ListSectionController {
    var weather: Weather!
    var isExpanded = false
    
    override init() {
        super.init()
        inset = .init(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension WeatherSectionController {
    override func numberOfItems() -> Int {
        return isExpanded ? 5 : 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let ctx = collectionContext else { return .zero }
        let width = ctx.containerSize.width
        if index == 0 {
            return .init(width: width, height: 70)
        }
        return .init(width: width, height: 40)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass = index == 0 ? WeatherSummaryCell.self : WeatherDetailCell.self
        guard let cell = collectionContext?.dequeueReusableCell(of: cellClass, for: self, at: index) else { fatalError() }
        switch cell {
        case let cell as WeatherSummaryCell:
            cell.setExpanded(isExpanded)
        case let cell as WeatherDetailCell:
            let title: String
            let detail: String
            switch index {
            case 1:
                title = "sunrise"
                detail = weather.sunrise
            case 2:
                title = "sunset"
                detail = weather.sunset
            case 3:
                title = "high"
                detail = "\(weather.high) C"
            case 4:
                title = "low"
                detail = "\(weather.low) C"
            default:
                title = "n/a"
                detail = "n/a"
            }
            cell.titleLabel.text = title
            cell.detailLabel.text = detail
        default:
            fatalError()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        weather = object as? Weather
    }
    
    override func didSelectItem(at index: Int) {
        collectionContext?.performBatch(
            animated: true,
            updates: { batchContext in
                self.isExpanded.toggle()
                batchContext.reload(self)
            },
            completion: nil
        )
    }
}
