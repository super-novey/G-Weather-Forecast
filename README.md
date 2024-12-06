# Weather App

This project allows users to search for a city or country and view detailed weather information, including the current weather, a 4-day forecast, and additional weather data. It also provides a feature to save and view a temporary history of weather information.

![alt text](<Screenshot 2024-12-09 at 12.47.53.png>)

## Features

- **Search for a City or Country**: Users can search for a specific location (city or country) to retrieve weather information.
  
- **Current Weather Information**: Displays the current weather for the selected location, including:
  - Temperature
  - Wind Speed
  - Humidity
  - And more…
  
- **4-Day Forecast**: Shows weather forecasts for the next 4 days with additional data.
  
- **Responsive Design**: The app is fully responsive and looks great on all devices including desktops, tablets, and mobile phones.

- **Temporary Weather History**: Weather data is temporarily saved and can be viewed again during the day, even if the internet connection is lost.

- **Add Cities to Track**: Users can add cities to their list and keep track of their weather information.

## Demo

You can try the app live here: [Demo Link](https://weatherapp-da1ce.firebaseapp.com/)

## Getting Started

Follow these instructions to run the project locally.

### Prerequisites

- Flutter 3.24.0 installed on your machine.
- A weather API key (WeatherAPI).

### Installing

1. Clone the repository:
   ```bash
   git clone https://github.com/super-novey/G-Weather-Forecast.git
2. Navigate to the project directory:
    ```bash
    cd g_weather_forecast
3. Open the terminal in the project directory, then clean the project and get the dependencies:
   ```bash
    flutter clean
    flutter pub get
4. Running Locally
   ```bash
   flutter run -d chrome
