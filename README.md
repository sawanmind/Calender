Custom Calendar.

Requirements

iOS 11.0+
Xcode 9.0+
Swift 4.0+

Manual Installation

Copy Controller folder, Image folder and View folder to your project.

Usage


for slot booking  


class CalenderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthViewDelegate {
    var delegate: CalenderDelegate?
    
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)

// Put your date in below array
  
  
    var bookedSlotDate = [12,27,4]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeView()
    }
    
    
    
    
    
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! dateCVCell
        cell.backgroundColor=UIColor.clear
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden=true
        } else {
            let calcDate = indexPath.row-firstWeekDayOfMonth+2
            cell.isHidden=false
            cell.dateLbl.text="\(calcDate)"
        
            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex  {
                cell.isUserInteractionEnabled=false
                cell.dateLbl.textColor = UIColor.lightGray
                
                // Apply your logic for slot selection which is already booked.
                
            } else if bookedSlotDate.contains(calcDate){
                cell.isUserInteractionEnabled=true
                cell.dateLbl.textColor = UIColor.red
            } else {
                cell.isUserInteractionEnabled=true
                cell.dateLbl.textColor = Style.activeCellLblColor
            }
        }
        return cell
    }
    
    
    
    
     func didTapDate(date: String, available: Bool) {
     // Get the selected date
        if available == true {
            print(date)
        } else {
            showAlert()
        }
    }
    
