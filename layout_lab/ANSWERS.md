
# CS442 Layout Lab — Team Board

**Name:** Muzaffar Ali  
**Roll Number:** 04072313007

## Numeric Answers

A1: 19

A2: 8

A3: 2

A4: 33

## Written Answers

### B1: Stateless and Stateful Classes

LabApp, HomePage, SettingsCard, Probe, Welcome, InfoPanel, SummaryRow, ShareRow, InfoBox and StampStack are StatelessWidgets because they do not manage changing local state.

Clock, Tile and SwapBoard are StatefulWidgets because their associated State objects manage changing values, such as the clock seconds, tile taps and tile order.

### B2: Widget, Element and RenderObject

Widget objects describe the user interface and can be recreated when setState triggers a rebuild. Elements are maintained in the widget tree and manage widget identity and State. RenderObjects handle layout, painting and hit testing.

Probe showed that the Widget identity can change during rebuilds while the Element identity remains stable. It also showed the runtime type of the widget associated with its BuildContext and whether a Scaffold exists above it.

### B3: Constraints Go Down, Sizes Go Up

In Step 7, Expanded gives each Text a share of the available Row width. The Row passes width constraints down to each child, and each Text determines its size within those constraints. The resulting sizes are then reported back up the widget layout tree. This allows the text to wrap instead of overflowing.
