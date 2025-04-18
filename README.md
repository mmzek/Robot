# 🤖 Ferdynand

### Project Description
The **Ferdynand** app, developed using Flutter, allows for contactless control of a robot’s movement. The application utilizes speech recognition and a proximity sensor to manage the robot's motion mode in real-time. Based on voice commands or proximity to an obstacle, the robot changes its direction.

### Features
- **Speech Recognition**: *Ferdynand* understands voice commands such as `"forward"`, `"backward"`, `"left"`, and `"right"`, and adjusts its movement direction accordingly.
- **Obstacle Detection**: A proximity sensor detects obstacles in the robot’s path.
- **Movement Visualization**: Each movement mode is represented by a sequence of squares, which are read by photodiodes.
- **Touchless Operation**: Once started, the app requires no further interaction – it continuously listens for voice commands and sensor data.

### How It Works
1. **App Launch**  
   When the app is launched on a device, microphone permissions are automatically granted, and the robot starts moving *forward*. The app continuously listens for voice commands and monitors the robot's environment.

2. **Obstacle Response**  
   When the sensor detects an obstacle, the robot automatically switches to *backward* mode for 3 seconds, then returns to *forward* mode, continuing movement. This allows for obstacle avoidance without user intervention.

3. **Voice Commands**  
   The app recognizes commands like `"forward"`, `"backward"`, `"left"`, and `"right"`. Based on these, the robot's direction is updated. After each command, the app resumes listening for the next one, allowing seamless hands-free control.

### Movement Visualization
- **Forward**:  
  <br> <img src="https://github.com/user-attachments/assets/09f0421f-5194-432a-9e65-37628017c916" width="400"/>
- **Backward**:  
  <br> <img src="https://github.com/user-attachments/assets/5932b3b6-2a50-47c0-8b1d-68d2e6d543d0" width="400"/>
- **Left**:  
  <br> <img src="https://github.com/user-attachments/assets/bdf32996-5269-4022-b7b0-308f39893857" width="400"/>
- **Right**:  
  <br> <img src="https://github.com/user-attachments/assets/a74e4888-6d61-49ce-9e06-8ba1dd91738e" width="400"/>

### Technologies and Libraries
- **Flutter**: The main technology used to build the app.
- **Permission Handler**: Manages access permissions for the microphone, required for speech recognition.
- **Proximity Sensor**: Detects obstacles in the robot’s path.
- **Speech-to-Text**: Translates spoken commands into text that controls the robot’s movements.

### Project Report and Demo
[Ferdynand.pdf](https://github.com/user-attachments/files/19815443/Ferdynand.pdf)

https://github.com/user-attachments/assets/6dc2499b-731b-44ce-8bcf-19e1aee53c07

### Future Development
Potential future improvements include:
- **Additional Voice Commands**: Support for more complex instructions like `"rotate"` or `"stop"`.
- **Advanced Obstacle Avoidance**: Implementing algorithms for smarter obstacle navigation.
- **Robot Reactions**: Using a Text-to-Speech library to provide feedback, e.g., when encountering an obstacle.
