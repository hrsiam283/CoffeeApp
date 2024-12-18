# CoffeeApp
Welcome to CoffeeApp, a SwiftUI-based application designed to explore and display information about different types of coffee from an external API.

Features
Coffee List: View a comprehensive list of coffee options fetched from a remote API.

Coffee Details: Explore detailed information about each coffee, including:

Name

Price

Region

Roast Level

Weight

Flavor Profile

Description

Error Handling: Graceful handling of loading errors with descriptive error messages.

SwiftUI Navigation: Naviate seamlessly between the coffee list and detailed views.

Technologies Used
SwiftUI: Modern UI framework for building declarative interfaces.

Combine: For state management and asynchronous data handling.

JSONDecoder: Decoding JSON data into Swift models.

URLSession: Networking for fetching API data.

Project Structure
CoffeeAppApp.swift: Entry point of the application, initializing the main ContentView.

ContentView.swift: Main view displaying the list of coffees and handling API integration.

CoffeeDetailsView: Detail view for displaying information about a selected coffee.

Coffee.swift: Model defining the Coffee data structure and its properties.

Contents.json: Metadata for Xcode project resources.

Getting Started
Prerequisites
Xcode 14.0+

iOS 16.0+

Installation
Clone the repository:
https://github.com/hrsiam283/CoffeeApp

Open the project in Xcode:
cd CoffeeApp
open CoffeeApp.xcodeproj

Build and run the project on the simulator or a physical device.

API Integration
The app fetches coffee data from the following API endpoint:
https://fake-coffee-api.vercel.app/api

API Error Handling
Invalid URL: Displays "Invalid URL".

Networking Errors: Displays the corresponding error message.

Data Decoding Issues: Displays "Failed to decode data" with details.

Screenshots
Coffee List Displays a list of coffees with their name and region.

Coffee Details Displays detailed information about a selected coffee.

App_Rreview
Image 1
<img width="542" alt="Screenshot 2024-12-18 at 12 41 34 PM" src="https://github.com/user-attachments/assets/56850051-bcf0-4e81-b523-2e633da42446" />



