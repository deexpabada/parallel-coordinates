# Parallel Coordinates
**Contributors: Dongmin Park and Paige Pfeiffer**

### Implementation
Static Visualization
![](https://raw.githubusercontent.com/deexpabada/parallel-coordinates/master/Screenshots/Screen%20Shot%202017-11-09%20at%209.26.09%20PM.png)

### Interaction
Filtering
![](https://raw.githubusercontent.com/deexpabada/parallel-coordinates/master/Screenshots/Screen%20Shot%202017-11-09%20at%209.26.36%20PM.png)

Axes Swap
![](https://raw.githubusercontent.com/deexpabada/parallel-coordinates/master/Screenshots/Screen%20Shot%202017-11-09%20at%209.26.21%20PM.png)

### Design Decision
We wanted to go for a minimalist design, because we hate chart junk. We were able to implement most of our decisions from the paper prototype. First, we wanted to highlight the axis when it was selected to move. We tried to create a stark contrast by using red. We strayed away from green or colors that could be compromised by color blindness. The axes are labeled at the top accordingly. Second, we used dark shade boxes that users drag with their mouse to filter the data points. We implemented a clear button on the bottom of the visualization to clear all filters if users wished. Lastly, the lines were drawn to represent a row of data. We chose a color that is easy to perceive and not too harsh on the eye, considering a large number of lines are drawn. The weight of the lines was adjusted to help perceive large quantities of lines as well. 

We originally wanted to add tick marks to the visualization and max and min values on the edges of the axes, but we did not implement them in the actual program. We also thought about having hover effects, but we did not implement hover effects to show raw data points.

### User's Manual
Disclaimer: The program is sometimes glitchy and will freeze up. 

**To Move Axes:** 
Click on the label of the axes and move to the location you wish. The axis will snap into place automatically and the rest of the axes will shift accordingly. 

**To filter**
Click and drag on an axis to select the range of data points. You can click and drag on multiple axes to filter on multiple axes. To clear all filters, click the button at the bottom middle of the screen. 

### Design Justification
1. **Task abstraction and chart junk** - We wanted to keep a minimal design with little chart junk. We strayed away from too much information on the screen to help showcase the lines more. The lines present patterns, so we tried to focus the attention on perceiving patterns and clusters. 
2. **Colors** - We chose a light shade of bluish purple that is not too harsh on the eyes. Considering some people cannot perceive green due to color blindness, we stayed away from green. To help accentuate the axis when selected, we chose a dark wine color to help contrast from the other axes. 
3. **Readability** - Considering that many lines are drawn in a limited design space, we tried to make the lines thinner so that there would be enough space between each line and occlusion is minimized. Instead of a white background, we use an off-white color that is less harsh on the eyes. The screenshots above do not have the creme background to maintain neatness in the read me.
4. **Interaction** - We wanted the visualization to be interactive to help reveal patterns and clusters. Filtering and axis translations help the users visualize patterns, trends, and clusters since they do not have to rely so much on memory. We thought it was important to add a clear button so that users can easily start over without having to restart the program. 

### Future Improvements
If time permitting, in the future we would like to improve our design by addressing the following limitations in our current visualization. 
1. **Labels and Data Points** - We want to show increments to help communicate the actual value of the data points.
2. **Smoother interaction** - We want to make smoother interactions by more sensitive mouse recognition and object interactions.
3. **More interaction** - We want the users to be able to interact more. Such examples would be picking colors for certain categories and showing actual data values on hover.

