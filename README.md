# kalshi challenge

One app to calculate the financial situation of the user. Based on the information about annual income and monthly costs, it will tell the score that represents how healthy his financial life is.

## Main file

The `main.dart` file starts the application with Material App.

## Core folder

Where we should place the files with important responsibilities all over the app. At first, we have only the `theme.dart` mainly with font definitions (typography), but we could have here other stuff like all the design colors, etc.

Other kinds of files here would be `constants.dart` or `functions.dart` with some helper functions like `timestamp` to get the current timestamp easily.

## App folder

Inside the `lib/app` folder, we have the application itself.

### Widgets folder

Isolated widgets that can be repeated in the application. Every widget should work by itself without any external dependency. It means that everything the widget needs to know must come from parameters. There's a possibility of Dependency Injection to be used on complex widgets, but it's recommended only when there is no other option. For now, that's not the case.

#### CustomScaffoldWidget

Each page will render as a child of it to make the main design definitions default all over the application.

#### CustomCardWidget

This widget renders a Card where the main content of the application appears. Normally, it would be a Card widget from Material Design itself, but it has some specific design definitions.

#### CustomTextFormField

Implementation of the TextFormField with custom design for the project.

#### WellnessScoreWidget

The bar which appears as a result of the income vs. costs calculation. It will be green when its type is `WellnessScoreType.high`, yellow when it's `WellnessScoreType.medium`, and red otherwise. Its size changes as well to represent it better.

The base of the structure of this widget is a Stack with three containers: the deepest is full width, the second 60%, and the first 30%, changing its colors depending on the type.

### Pages folder

As the name suggests, here is the navigation of the app. In this case, we prefer to name the main route as `wellness` instead of `home`, suggesting that the navigation names will be based on its functionalities or features.

#### Pages and Controllers

Page files must have only widgets and visual definitions. No logic should be placed here unless it's strictly necessary. When some logic is required, then only the controller should be used to do it. Each page has only one controller, and the use of one controller method should be avoided in another one, but it is possible. To do that, use some kind of Dependency Injection like GetIt, Riverpod, Provider, or something like that.

## Final considerations

This project was implemented as minimally as possible. There are a lot of features I could've added here just to impress you, but it would only make the project bigger without necessity because its functionality doesn't require it, so I opted not to do that.

There's no Dependency Injection implemented, no Models, no repositories, no routes for navigation, just because I opted to keep it simple.

It would be nice to implement something like `SharedPreferences` to keep the last result stored. I was about to make it, but sadly I don't have much time now.

Thank you.
