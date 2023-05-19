# Use ListView.builder/GridView.builder when you want to display a large number of data

> - In this example, we’re using ListView.builder instead of a simple ListView, and it technically renders the same things on the screen. But now let’s talk about the difference between those two.

> - When we use ListView/GridView or wrap a Column in SingleChildScrollView then what it does basically renders it’s all of the children when we open that screen. If the data is small then it won’t make much big difference but if we have thousands of data then our app will start to stutter or worse it will crash

> - But then what about ListView.builder()?

> - ListView.builder() / GridView.builder() only renders the data which is visible on the screen. So you can have thousands and thousands of data but it will only render the data which we are seeing on a screen at a particular time, therefore it won’t try to load every data in its memory which is a lot more performance efficient.


> - Use CustomScrollView