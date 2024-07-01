# BusTrip
Bus Trip Manager

Technology used: 
- XCode 15.0.1
- Combine
- SwiftUI
- CoreData

Libraries Added:
- snapshot testing (https://github.com/pointfreeco/swift-snapshot-testing)
- poyline (https://github.com/raphaelmor/Polyline)

Decisions:
- App for iPhone on portrait mode and minimum deployment 17.0
- Choosed blue color as primary because it's a calm color that I think fits for a Bus Trip App
- Select first trip (if available) at the start
- Set minimum date for the report 10 years ago and maximum date today
- Preestablish date as now
- Disable save button until information is valid
- Added Light / Dark mode support

Things to improve:
- Add swiftlint
- Add diferent colors for the trip status
- Order trips by date and status
- Add user location

# Screenshots
<img src="https://github.com/xramos/BusTrip/assets/1492227/7a29aad1-ce9e-4191-af52-1281bb7fc05c" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/4bed7010-f941-47d3-83bf-ce8bcf24021e" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/1288dc14-8e2e-4f7d-9677-0b9d7e8a2560" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/1fc7dd22-9ce5-4e6a-b17e-a43a0ed54910" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/554ded2d-1ac8-4df5-be5e-0aa418f7db6a" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/298690fb-a405-466d-88d2-1d9a97345639" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/9bf1667b-b43d-47ee-8905-3552527485f2" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/e93bdd3f-322e-4662-9f42-271bc02731cb" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/b71285a6-d419-4211-98f5-d22928446fe6" width="200" />
<img src="https://github.com/xramos/BusTrip/assets/1492227/25f82887-a539-4a1e-abdc-931a979c8edc" width="200" />

# Front End Problem Description
You are asked to build a simple trip manager for our bus on demand solution. This tool will be used by the operators of the service in order to see the trips available in the system. The problem has four tasks and you should solve each one before the next.

## Task 1: Trip list
- Goal:
The initial screen should show a map and scrollable list of the current available trips.
- Guide:
  - Each trip card should show some information: driver name, timestamps,... You can choose what you think is more important.

## Task 2: Select trip
- Goal:
When we click on one trip, it should be shown on the map. (map centers and zooms towards it)
- Guide:
  - The route of the trip and the points of each stop should be shown on the map.
Also the start and finish points of the trip.
  - The map should be centered on the route and zoomed.
  - It should be clear to the user which trip has been selected.
  - The route returned by the API is a google encoded polyline. (check this) - You can
use this third-party library: Polyline encoder / decoder in swift to represent the polyline on the map if you want to:

## Task 3: Stop info
- Goal:
When we click on one stop, a popup with the information of the stop should be shown.
- Guide:
  - Each stop bubble should show some information about it: passenger, time,...
You can choose what you think is more important.

## Task 4: Contact form
- Goal:
On the main screen we should be able to open a contact form in order to report an issue.
- Guide:
  - The form should ask the name and surname of the user, email, phone
(non-mandatory field), date and time of the reporting bug and a multiline input text (200 characters max) for the report description.
  - This data should be validated and stored locally (you don’t need to send it to a server).
  - The application’s icon badge number should display the total number of stored issues.
