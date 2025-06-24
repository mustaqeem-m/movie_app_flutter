# movie_app

# Section 9 -> movie_application

ListView.builder(
  itemCount: yourList.length,
  itemBuilder: (context, index) {
    return YourWidgetHere;
  },
)


`itemCount`	Total number of list items to show (yourList.length)
`itemBuilder`	Function that returns the widget for each item at given index
`context`	Flutter passes this in — needed to build the widget tree
`index`	Current position in the list (0, 1, 2, ...) — use to access data

# Why use` .builder`?

- Builds only `visible widgets`

- `Saves memory` for long/scrollable lists

- `Dynamic generation` based on data

# maps 

- maps is a collection that allows us to have key value pairs

we’re creating a Movie class to cleanly extract structured data from messy JSON,
and using a factory constructor to parse it into usable Dart objects.

- for the data in json need to parsed we need to create a helper fn |  util  fn that contain a static method 

# static method 

- static method is a method that can be called on the class itself without having to create an instance of the class

- `static` = `no object needed`.
Use it when your method doesn’t depend on any class variable

simple words => for calling these type of method we dont need to create a object , we directly call them like a helper fn!

# init state in statefulwidget

- called when corresponding object is inserted into the tree 
- inside this we setup everything thats need to be proceed.

@override
  void initState() {
    Provider.of<Movieprovider>(context , listen: false)
    .loadMovies(context);
    super.initState();
  }

  this make sure provider inside initstate called every time before every build , remember its inside the build.
  

