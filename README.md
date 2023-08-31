# Mars Weather - iOS Application

![Mockup of two iPhones displaying the Mars Weather Application. A temperature data visualizatin screen is shown on the left. The main screen showing a list of weather reports and details from a single weather report is on the right.](https://i.imgur.com/PXCdKK9.png)

<a href="https://apps.apple.com/us/app/mars-weather/id6461012988?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1692316800" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>

## Description

Explore and discover the Martian climate with Mars Weather, a native iOS application written with Swift and SwiftUI. Seamlessly harness data transmitted by the NASA Curiosity Rover Environmental Monitoring Station (REMS) to meticulously track and dissect weather phenomena on the planet Mars. Review the latest weather reports, track trends through sleek data visualizations, and explore the contrasts between Earth's and Mars' weather patterns.

## Getting Started

To start using Mars Weather, you can [download it on the Apple App Store](https://apps.apple.com/us/app/mars-weather/id6461012988).

For first time users, there are a few useful things to know before navigating the app:

* On Mars each solar day is referred to as a sol. 
    * The days on Mars are about 24 hours and 40 minutes long, so they don't sync properly with Earth days—hence the differentiation by using the term sol.
    * With the absence of a standardized calendar on Mars, a couple days after the Curiosity rover landed on Mars (August 7, 2012) is represented as sol 1.
* Access to the weather data coming from the rover is often delayed by several Earth days as the NASA team processes the new data and updates the API.
* Due several factors (e.g. Mars' thin atmosphere and proximity to the Sun), you will note many differences between Earth's and Mars' weather patterns. For example, the range of high and low temperatures each day is much wider on Mars.

## App Features

### Latest Weather Reports

The main screen of the application allows users to scroll through the last 30 days of weather reports on Mars. By selecting an individual report, a user can view the following details about the particular sol:

* Max Temperature
* Min Temperature
* Sunrise time
* Sunset time
* Weather Condition (e.g. Sunny)
* Pressure
* UV Irradiance

### Weather Data Charts

When the user taps on a particular weather detail, the app displays a modal with a data visualization powered by Apple's first-party Swift Charts framework. Below are some examples of the charts you can analyze using Mars Weather.

#### Temperature
![Screenshot of a chart in the Mars Weather app visualizing the temperature over time on Mars. There are four data types being plotted: maximum air temperature, minimum air temperature, maximum ground temperature, and minimum ground temperature.](https://i.imgur.com/a6vqj9b.png)
#### Daylight
![Screenshot of a chart in the Mars Weather app visualizing the times of daylight on Mars. The x-axis represents the date and the y-axis shows the time of day of sunrise.](https://i.imgur.com/JzJow79.png)
#### Weather Conditions
![Screenshot of a chart in the Mars Weather app visualizing the weather conditions on Mars. The x-axis represents weather condition (e.g. sunny) and the y-axis percentage of sols that the had the weather condition for the given time period.](https://i.imgur.com/oKd4ObB.png)
#### Pressure
![Screenshot of a chart in the Mars Weather app visualizing the pressure on Mars over time. The x-axis represents the date of the data point and the y-axis displays the pressure in Pascals.](https://i.imgur.com/S724beK.png)
#### UV Irradiance
![Screenshot of a chart in the Mars Weather app visualizing the UV Irradiance Mars over time. The x-axis represents the date of the data point and the y-axis displays the level of UV Irradiance recorded that day.](https://i.imgur.com/tkjvrFb.png)

## Future Plans

One of the hardest parts about releasing an application to the App Store is making the hard decision that the quality of the app is "good enough" to publish the first iteration to the public. Acknowledging this challenge, I forced myself to release Mars Weather in its current state which is not as polished as I wanted it to be. As such, I intend to continue development on Mars Weather by working on the following features.

### Chart Improvements

This application was my first experience using Apple's data visualization framework, Swift Charts. As a newer framework, I primarily relied upon Apple's WWDC talks and their documentation to learn how to implement Swift Charts within my own app. I ran into two main problems that haven't been resolved yet:

* There is a delay / lag as the UI draws all of the data marks when the user selects the "ALL" time range, which spans 3500+ different data points.
* Initial attempts at animating the chart resulted in an bug where the data marks temporarily stretch in unexpected ways, then snap into the correct place once the animation is finished.

Fixing these problems with the data visualizations is top on my list to create a more polished experience for Mars Weather users.

### Accessibility

I believe in creating software that can be used by any person. In an upcoming update to Mars Weather, I will closely audit the current state of accessibility and apply Apple's best practices to test and improve accessiblity for the application. At its core, Mars Weather is for educational purposes, so it's a key goal of mine to ensure everyone can use the app to learn more about the planet Mars.

### Localization

As a developer currently based in Canada, I would like to localize the app to support both official languages of Canada, English and French. Time permitting, I am also interested in adding Spanish as a supported language for the application as well.

### Dependency on External API

Mars Weather uses a 3rd-party API provided by [Centro de Astrobiologia (CAB)](https://cab.inta-csic.es/), which was the original inspiration for creating this application. However, I encountered a few frustrations with having no control over the backend for the application. For example, everything that comes back from the API in the payload is a string, which makes type safety for numeric types (e.g. temperature, pressure) a pain to control in a Swift application. Eventually, I would like to create my own backend service, which periodically indexes data from the original API.

### Push Notifications

Another benefit of building my own backend service, is that I could easily implement server-side push notifications for various events. For example, the app could alert users when new data has arrived from the Curiosity Rover or if a disruption to data from the rover occurs.

## Credit

The weather data used in this application is provided by [Centro de Astrobiologia (CAB)](https://cab.inta-csic.es/). Mars Weather is for educational purposes only.

The REMS video was provided [courtesy NASA/JPL-Caltech](https://www.jpl.nasa.gov/jpl-image-use-policy).

Thank you to the following developers for providing code for these utilities:

* **Cache.swift** - Authored by John Sundell in his tutorial [Caching in Swift](https://www.swiftbysundell.com/articles/caching-in-swift/).
* **Bundle+Ext.swift** - Authored by Paul Hudson in his article [How to decode JSON from your app bundle the easy way](https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way).

Special shoutout to my mentor Vladimir Cezar for putting up with my constant state of confusion while learning MVVM and the resulting unending stream of questions on the topic!