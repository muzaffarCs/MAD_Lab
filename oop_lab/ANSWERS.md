Name: Muzaffar Ali  
Roll Number: 04072313007

Q1. What can a subclass using extends use for free that a class using implements has to write itself?

The implemented fields and methods of the parent are inherited by a subclass that uses extends. All necessary instance members must have implementations provided by a class that uses implements.

Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?

When sharing behavior between classes without incorporating it into their inheritance tree, a mixin comes in handy. When linked subclasses have similar types, states, and behaviors, an abstract parent class can be helpful.

Q3. Why must you override hashCode whenever you override ==?

Hash codes for equal objects must be equal. Otherwise, logically equal objects might not be handled appropriately by Sets and Maps.

Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?

An extension modifies an existing type's class while adding new behavior. Extensions offer a mechanism to add assistance methods because Dart's String type cannot be subclassed.