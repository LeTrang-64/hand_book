## Which is the fastest? [See more](https://itnext.io/comparing-darts-loops-which-is-the-fastest-731a03ad42a2)
There are while loops, for loops, for…in loops, the .forEach method, the .map method and more. In this article, we will test these various methods of looping and see which is the fastest!

> Using the [benchmark_harness](https://pub.dev/packages/benchmark_harness) package
> 
### Optimisations

### Caching length

- while loop with uncached length
```agsl
var count = 0;
num eachElement = 0;
while (count < list.length) {
  eachElement = pow(list[count], 3);
  count++;
}
```
- Here is an example of a while loop with cached length:
```agsl
var count = 0;
num eachElement = 0;
var length = list.length;
while (count < length) {
  eachElement = pow(list[count], 3);
  count++;
}
```
When we cache the length of a list before looping, the length of the list is calculated only once and not recalculated on each iteration. However, when we do not cache the length, the length is calculated per iteration. For lists with a large number of elements, this should have significant performance gains.
