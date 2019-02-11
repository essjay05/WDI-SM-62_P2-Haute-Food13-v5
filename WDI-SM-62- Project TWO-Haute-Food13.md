# WDI-SM-62: Project ONE ... by Joy Serquiña)
### Build a Full Stack Ruby on Rails
I have created a full stack app with Ruby on Rails that is a "Foodstagram" of sorts for foodies like myself. Users would be able to see food posts that others have posted in order discover popular/trending ("haute" if you will) foods as well as post their own food images.



### Preview
![Haute-Food13 splash/about page](https://i.imgur.com/8RTwrml.png)
![Haute-Food13 sign up page] (https://i.imgur.com/NshuHSV.png)
![Haute-Food13 sign  page] (https://i.imgur.com/SIt8y6Z.png)
![Edit Profile page] (https://i.imgur.com/zNXWApU.png)
![Community food feed page] (https://i.imgur.com/AEvJkCO.png)
![User's food feed page] (https://i.imgur.com/iLVc1gV.png)
![User's new post page] (https://i.imgur.com/cm7jY0h.png)
![User's edit post page] (https://i.imgur.com/FsBRreR.png)


### User Flow Sketch
![HF13 User Flow Sketch pg 1] (https://i.imgur.com/9e0gNv8.jpg)
![HF13 User Flow Sketch pg 2] (https://i.imgur.com/cQpdW2g.jpg)


### ERD

![Relationship btw User and Post Models] (https://i.imgur.com/lnTyxwo.jpg)


### My Process
#####Pre-Coding:
1. I started by writing out my idea and jotting down the two models/Schemas (User Schema and Post Schema) that intend to incorporate in my app. 
2. Then went on to sketching out wireframes of each section as shown here:
### User Flow Sketch
![HF13 User Flow Sketch pg 1] (https://i.imgur.com/9e0gNv8.jpg)
![HF13 User Flow Sketch pg 2] (https://i.imgur.com/cQpdW2g.jpg)

3. I then created my user stories in trello to list the actions they would take, what they would see etc: ![Screencapture of trello to do list](https://i.imgur.com/SFJ3lma.png). The way the Trello looks with the food image on the background is how I intend to style my app pages with a different food on each page.
5. Talked through my ideas/ processes with Zac and Alex for approval.
6. Create a new git repo for the project.

#####Setting up the Database & Authentication:
1. Created and set up with PostgreSQL.
2. Set up the authentication.
3. Set up the CRUD-able resource for my User Model Schema.
4. Set up the CRUD-able resource for my Post model Schema.


#####Setting up the functionality:
1. Created a forEach loop to iterate through the all the users posts' in my database to show the data on "Food Feed" page.[Screencapture of forEach code on hike list page](https://i.imgur.com/6WwNmeE.png).
2. Created a forEach loop to iterate through the all the Current User's posts' in my database to show the photo's they have posted on the "Your Yums" page.[Screencapture of forEach code on hike list page](https://i.imgur.com/4N8nhYr.png).
3. Upon signing in the User is led to the Community feed page to see other food posts.
4. When clicking on Their Yum's page, they are led to seeing their posts as well as link to edit their profile and add a post.
5. From the User profile edit page they can also delete their post.
6. Once I worked out the uploader with Active Storage, I implemented it into my new post page form.
7. Upon getting Active Storage uploader to work with uploading images to my database, I connected it to the S3 Bucket that I created in Amazon Web Services to hold my files.

#####Focused on trying to figure out how to upload files and save them to Amazon Web Services
Did a bunch of research over the course of 3 days reading articles and watching videos on how best to implement it.

Ended up using Active Storage for Rails as my uploader and then once it was functioning I attached AWS to it.

In order to use AWS I had to: 
1. Sign up for an AWS account.
2. Create an Identity and Access Management sign in.
3. Get all of the keys and secret keys.
4. Create an IAM policy to apply to a User.
5. Create a user.
6. Create an S3 bucket.
7. Connect the keys to an 

#####Pushed to Heroku:
1. Saved to Github during each major save/change.
2. Saved and deployed to Heroku successfully on Thursday with my basic CRUD with my 2 models WITHOUT the uploader working.
3. Managed to deploy to Heroku upon getting Active Storage and AWS to work, but for some reason Heroku ran an error when trying to open the app.
4. Fine tuned my app and adjusted some things and pushed to Heroku and it is now fully functioning.

##### Technologies Used
16. Used the following:
17. HTML5 / ERB Layouts to build the structure and layout of the views based on the wireframes I sketched out in the beginning.
18. CSS3 / Bootstrap to adjust the spacing and general form/navbar functionality.
19. Ruby was used to create the functionality of the routes/paths/buttons/form submissions to communicate with the back-end. 
20. PostgreSQL, was used to build, test and develop the back-end database.
21. Used Trello to track my daily goals and productivity as well.
22. Used Git/Github to save/track my build as it progressed.
23. Used Heroku to deploy my app.
24. Used Active Storage to enable an uploader for my Posts model.
25. Used Amazon Web Services to create an S3 Bucket to hold the image files that get uploaded to my app.



##Unsolved Problems:
* I want to implement Google Maps with the Vendor address so users can find the food locations.
* I'm going to fully style it out.
* I want to add like and possibly follow features.

## Wins :)
* SUPER WIN: Got a file uploader to work (Active Storage) and connect to Amazon Web Services (AWS) to host my uploaded files!! Took 3 days but it was worth it. Here are some snippets of the pieces of code that enabled it: 
* [Screencapture of Schema showing Active Storage](https://i.imgur.com/ahsDHGH.png).
* [Screencapture of Schema showing Active Storage Class](https://i.imgur.com/U0KQYL4.png).
* [Screencapture of Schema showing Active Storage](https://i.imgur.com/Q1LqKYK.png).
* [Screencapture of Schema showing Active Storage](https://i.imgur.com/h9VMYNk.png).
* Got my authentication and database set up pretty early on and fully functioning CRUD for my User model Schema!
* Got to fully CRUD my 2nd model: Posts.

### Credits:
*Joy Serquiña

### Designed and Developed by: Joy Serquiña 
*[Link to Joy's github for Project 2: Full Stack App] (https://github.com/essjay05/WDI-SM-62_P2-Haute-Food13-v5)
*[Link to live site hosted up by Heroku](https://nameless-eyrie-14279.herokuapp.com/)


