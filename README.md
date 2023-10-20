# Car Heist Script Documentation

This script is designed for a car heist scenario in FiveM. It handles various aspects of the car heist, including vehicle deliveries  and vehicle scrapping.

## Script Overview

The script comprises various functions and events, each serving a specific purpose within the car heist scenario.
## Installation Steps

1. **Download**:
   - Download the Car Heist Script resource folder.

2. **Upload**:
   - Upload the Car Heist Script resource to your server's resources directory.

3. **Configure and Restart**:
   - Configure the script as needed, and add it to your `server.cfg` file using `ensure kuf-carheist`.
   - Restart your FiveM server to apply the changes.

## Mandatory/Reqired
`-BJCore Framework
-mythic_progbar`

### Initialization

The script starts by initializing some variables and setting up a few essential things. These include spawning a start NPC and a dog NPC.

### Dog Interactions

The script allows players to interact with a dog NPC. Players can "pet" the dog, which triggers a progress bar and provides small rewards(which can be changed) while they wait for the info from the boss.

### Car Heist

The main part of the script revolves around car heist scenarios. Players can receive job assignments of different levels (A, B, and C). Each job involves delivering a specific vehicle to a designated location.

- `kuf-carheist:getJobA`: Initiates an entry-level job.
- `kuf-carheist:getJobB`: Initiates an intermediate-level job.
- `kuf-carheist:getJobC`: Initiates a senior-level job.

Players can also scrap vehicles to earn rewards (which can be changed):

- `kuf-carheist:ScrapVehicle`: Allows players to scrap a vehicle.

### Job Progress

The script keeps track of job progress, ensuring that players have the appropriate job level and are within the delivery range.

### Marker Interaction

Players can interact with markers to deliver vehicles or scrap them. The interaction is triggered by pressing the "E" key when in proximity.

## To-Do List

- [ ] Add error handling for failed vehicle deliveries.
- [ ] Improve marker interaction to provide clearer feedback to players.
- [ ] Improve Placement Blips to provide clearer feedback to players.
- [ ] Implement additional peds for each differnt level.
- [ ] Enhance code comments and documentation for better readability.
- [ ] Add Locals for different languages.

# CREDITS:
[The Modding Collectiive Who Made BJCORE Framework](https://themoddingcollective.com/)
[Highly Inspired By Oosayeroo](https://github.com/oosayeroo). With his [qb-miniheists](https://github.com/oosayeroo/qb-miniheists)

