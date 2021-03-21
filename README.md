Members: Robert Dillman
Admins: JGratch, RDillman

Project: TWU Bucket List IOS Project



## 02/21/2021 Starting day

I Have acquired a macbook to begin the project, downloaded and installed xcode. 

## 02/24/2021 Finding it hard

I began tickering with the xcode application and found that the version I had downloaded looks very different from the older applications, I am struggling to follow along with some tutorials due to theses slight changes. 

Managed to get a basic app using viewcontroller.swift and main.storyboard. 

## 03/02/2021 Learning

I started with some basics on how to transfer data from once storyboard ot another. 
as I got that understoood I started my TWU Project 

I got my main screen setup with a tableview. going to dive into deeper knowledge next time. 

## 03/05/2021 Controllers and delegates

I started gettin into how the data gets loaded onto the table and how to manipulated the data. 
Learned about UserDefaults and Keys to them. and learn how to load that data into an array with each iteration see below

  func updateTasks(){
        tableView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        items.removeAll()
        latitudes.removeAll()
        longitudes.removeAll()
        descriptions.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..count {
            if let item = UserDefaults().value(forKey: "item_\(x+1)") as? String{
                items.append(item)}
            if let latitude = UserDefaults().value(forKey: "latitude_\(x+1)") as? String{
                latitudes.append(latitude)}
            if let longitude = UserDefaults().value(forKey: "longitude_\(x+1)") as? String{
                longitudes.append(longitude)}
            if let description = UserDefaults().value(forKey: "description_\(x+1)") as? String{
                descriptions.append(description)}
        }
        tableView.reloadData()
  }
This helped me load data from from different arrays in the same order. 

I only push the items array using extension ViewController: UITableViewDataSource 

I cerated a 2nd & 3rd viewcontroller called AddViewController and AlterViewController. 
setup add view controller to take in 4 data values and setup the nav panel for save(topright) and back(topLeft)

I was able to test and confirm the data came through. 


## 03/07/2021 Milestone

I tested my application again and tried to get it setup to the remote Gitlab repository. HAd several difficulties. 
Decided to just upload a zip and spend more time on how to setup remote repository on xcode for the final project. 



## 03/16/2021 Alter table view nightmare

I started working out of the alter table view and was proud of my resultes in the alter table view I ws getting all the data pushed through and appied to labels. 
I started with a delete function. This was successfull to I didnt have much trouble count and deletion location. 


Editing the individualselected cell was a nightmare no matter how much I try the edit function I built isnt changing the values.  I have tried deleteing and just adding the values to a new count. But it does nothing. 

I was able to get 80% of the application functioning as expected just the edit is not working


Left todo:
Launch story board
fix edit if you have time
mark completed task in alter
add popup questions for delete. 

## 03/20/2021 A lot done


Learning how to setup the launch storyboard was very straight forward. The one I designed was simple, it matches my app. 

I tried working on the complicated edit function that continuous to plague me I setup a label In my alter to confirm the right numerical value was coming through to edit the right value in the arrays. 

But still no luck. 

Was able to setup an Ok//cancel alert for deleteing a task. Feel pretty proud of that. 

Created a Mark completed button
This mark completed button measure each time you complete a task and tels you how many have been completed!
Once dismissed the task gets taken off the board for the user. 


## 03/21/2021 Save changes research

I spent most of this day getting gitlab setup and commited/pushed

I researched about 10 articles on how to edit specific values in an array / UserDefaults. Most werent any help or would not work when I implemented it. 
After several hours of failure I decided to let it go. If I am unable to get it in the project I can make the rest of my project sparcle

I cleaned up my app, got everything working cleanly
inverted my tableview so the newest would be on the top. oldest on the bottom. 

finally did my last push commit update version 1.4

emailed the professor about some mistakes I had made with the remote setup and wrapped up this project. 




