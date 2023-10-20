# Car Heist Script Documentation

This script is designed for a car heist scenario in FiveM. It handles various aspects of the car heist, including vehicle deliveries and vehicle scrapping.

## Script Overview

The script comprises various functions and events, each serving a specific purpose within the car heist scenario.

## Installation Steps
```
1. Download: 
   - Get the Car Heist Script resource folder.

2. Upload: 
   - Upload the Car Heist Script resource to your server's resources directory.

3. Configuration and Restart: 
   - Configure the script as needed, and add it to your `server.cfg` file using `ensure kuf-carheist`.
   - Restart your FiveM server to apply the changes.
```
## Mandatory Requirements
- BJCore Framework
- mythic_progbar

## Dog Interactions

The script allows players to interact with a dog NPC. Players can "pet" the dog, triggering a progress bar and receiving small rewards while they wait for information from the boss.

## Car Heist

The core part of the script involves car heist scenarios. Players can receive job assignments of different levels (A, B, and C). Each job entails delivering a specific vehicle to a designated location.

- `kuf-carheist:getJobA`: Initiates an entry-level job.
- `kuf-carheist:getJobB`: Initiates an intermediate-level job.
- `kuf-carheist:getJobC`: Initiates a senior-level job.

Players can also scrap vehicles to earn rewards.

- `kuf-carheist:ScrapVehicle`: Allows players to scrap a vehicle.
- 
## Job Progress

The script keeps track of job progress, ensuring that players have the appropriate job level and are within the delivery range.

## Marker Interaction

Players can interact with markers to deliver vehicles or scrap them. The interaction is triggered by pressing the "E" key when in proximity.

## To-Do List

- [ ] Add error handling for failed vehicle deliveries.
- [ ] Improve marker interaction to provide clearer feedback to players.
- [ ] Enhance placement blips to provide clearer feedback to players.
- [ ] Implement additional NPCs for each different level.
- [ ] Enhance code comments and documentation for better readability.
- [ ] Add localization support for different languages.

# Credits

- [The Modding Collective Who Made BJCore Framework](https://themoddingcollective.com/)
  
- [Highly Inspired By Oosayeroo.](https://github.com/oosayeroo) Check out his [qb-miniheists](https://github.com/oosayeroo/qb-miniheists)
