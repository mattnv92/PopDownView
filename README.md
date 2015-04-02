# PopDownView
PopDownView is a Swift library used to quickly make simple and elegant pop ups


# Getting Started
1. Download the PopDownView.swift file
2. Drop the file into your project
3. DONE! See, that wasn't so bad!


# How To Use

Creating a PopDownView is super simple

So by now you should have the PopDownView.swift file inside of your project.

First, go ahead and create a nib file. 
Yes, we're going to be using nibs. I know, I know, some of you may be moaning up a storm right now, but just give it a chance!

##Creating a Nib File.

1. Press <kbd>CMD</kbd> + <kbd>N</kbd>
2. Go to User Interface
3. Highlight View
4. Click next
5. Name the Nib whatever you want
6. Click create


###Extra Steps for Nib
Here are some extra things you can do to make your nib look pretty

1. Click the View inside your nib file
2. go to the Attributes Insepctor (4th tab on the right hand side menu)
3. Change Size to "FreeForm"
4. Change Status Bar to "None"

##Hooking up Nib
So you've made your view all nice and pretty. Now what?

1. Find "File's Owner" in the left menu of your nib file and click it
2. Navigate to the Identity Inspector (3rd tab on right hand side menu)
3. Change Custom Class to "PopDownView"
4. DONE! Your nib is all hooked up.

##Creating a PopDownView Object
Now that your nib is all hooked up, you're going to need to actually create the object in code.

I'm going to give you an example of the intended way to create the object. 

```
    var MyPopDownView: PopDownView?
    MyPopDownView = PopDownView(frame: CGRect(x: 100, y: 100, width: 100, height:100), withNibNamed: <INSERT NAME OF NIB FILE IN HERE>)
```

##Interface
You want to take a look at the interface eh? Well buckle up big boy (or girl) because you are about to witness one of the *biggest* interfaces ever created...



You buckled up?


You sure?


Here.


We.


Go.


###Constructor
#####init(frame: CGRect, withNibNamed: String)

###Methods
#####open()


In all seriousness, I wanted a super light interface because this is an object I fully intend for you to subclass and expand upon yourself. The initializer is a bit weird because it's a custom initializer, but I think it is a decent approach.  


###Feedback
I know I am not a master of Swift or IOS, so please, if you have any feedback, do not hesistate to shoot me an email! Mattnv92@gmail.com


###Enjoy!

