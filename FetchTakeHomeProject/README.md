### Summary: Include screen shots or a video of your app highlighting its features
    Google Drive link with video: https://drive.google.com/file/d/1fVZsKiOKozkNwo7gbXK9zblTFKRcCyis/view?usp=share_link
    
    Highlights:
    - SwiftUI
    - Swift Concurrency in networking using Async/Await
    - MVVM design pattern
    - ObservableObject protocol to support iOS 16
    - Utilized NavigationStack
    - Custom Image Caching
    - In App Safari sheet
    - Swift Testing unit tests

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
    An area that I prioritized was the image caching. I haven't had an opportunity to deep dive into custom caching options before
    and used this project as a chance to.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
    ~75 minutes: Folder Structure, Design Pattern & ViewModel
    ~65 minutes: View Design
    ~80 minutes: Image Cache, updating view model with image cache.
    ~60 minutes: Testing

### Trade-offs and Decisions:
    To simplify image caching, I created a CacheRecipe struct to nest the recipes inside of it to handle the image without having to
    worry about the UIImage type not being codable.
    Originally, I was going to create a separate networker but ended up putting the networking logic within the view model 
    to simplity image caching

### Weakest Part of the Project: What do you think is the weakest part of your project?
    The caching part within the fetch request. I feel like there is a more efficent way to handle it vs using 
    a for loop.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
    This was my first time trying out the new Swift Testing framework. With it being new, I haven't dived into much of the documentation and didn't want to to spent too much time exploring the framework due to time contraints.
