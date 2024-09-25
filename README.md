# ggwpx-aimedic

## Description

`ggwpx-aimedic` is a medical system designed for FiveM servers using QBCore. This script allows players who are in a "down" or "last stand" condition to request medical assistance from EMT (Emergency Medical Team) in a simple and cool way. With innovative features and informative notifications, `ggwpx-aimedic` enhances the roleplay experience with a polished and integrated system.

## Features

- **Realistic Medical Response**: Provides ambulances and NPC doctors that respond to player medical calls realistically.
- **Informative Notifications**: Clear and informative notifications to keep players updated on the status of medical services and costs.
- **Easy Configuration**: Easily adjustable settings through the configuration file for service costs, revive time, and minimum number of EMTs required.
- **Discord Logging**: Integrated logging feature with Discord to track payments and service requests.
- **CPR Animations**: Uses CPR animations to add authenticity to the healing experience.
- **Engaging User Interface (UI)**: Processes and notifications are presented in an engaging and easy-to-understand manner.

## Installation

1. **Download and Extract**
   - Download the ZIP file from this repository and extract it to the `resources` folder in your FiveM server directory.

2. **Add to Server**
   - Add the following entry to your `server.cfg` file:
     ```plaintext
     ensure ggwpx-aimedic
     ```

3. **Configuration**
   - Open the `config/config.lua` file and adjust the settings according to your server’s needs:
     - `Config.Doctor` - Minimum number of EMS required online to fulfill a call.
     - `Config.Price` - Cost of medical services.
     - `Config.ReviveTime` - Time required for revive (in milliseconds).

4. **Discord Logging**
   - Enter your Discord webhook URL in the `config/discordlog.lua` file to enable logging of payments and service requests.

## Usage

- **Command to Call EMT**: Type the command `/medic` while in a "down" or "last stand" state.
- **Notifications**: You will receive notifications about the status of the ambulance on its way, or if there are issues with payment or the number of available EMTs.

## Advantages

- **Simple and Cool**: Designed for ease of use while providing a fun roleplay experience with an attractive interface.
- **Flexible**: Easily configurable to fit the specific needs of your server.
- **Immersive Experience**: Provides a medical system that makes roleplay deeper and more realistic with effective animations and notifications.

## Contributing

If you wish to contribute to the development of this script, please create an issue or pull request on this GitHub repository. We appreciate contributions and feedback from the community.

## License

This script is licensed under the [MIT License](LICENSE).

---

Thank you for using `ggwpx-aimedic`! If you have any questions or need assistance, feel free to open an issue on GitHub or contact us.
