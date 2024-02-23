# Exercise 1
~~~mermaid
graph TD;
    p1((p1 \n *))
    p2((p2 \n *))
    p3((p3))
    p4((p4))
    p5((p5))
    p6((p6))
    p5b((p5b \n ***))
    p6b((p6b \n **))
    t1(t1)
    t2(t2)
    t3(t3)
    t4(t4)
    t5(t5)
    t6(t6)

    p1 --> t1
    t1 --> p3
    t1 --> p5
    p5b --> t1
    p6b --> t1

    p2 --> t2
    p5 --> t2
    t2 --> p4
    t2 --> p5b

    p3 --> t3
    p6 --> t3
    t3 --> p1
    t3 --> p6b

    p4 --> t4
    t4 --> p2
    t4 --> p6

    p5 --> t5
    t5 --> p5b

    p3 --> t6
    t6 --> p3
    t6 --> p5
    p5b --> t6
~~~

# Exercise 2
Marking: $(p_1,p_2,p_3,p_4,counter)$

Initial marking: $(1,0,0,0,0)$

Final marking: $(0,0,0,1,0)$

~~~mermaid
graph TD;
    p1((p1))
    p2((p2))
    p3((p3))
    p4((p4))
    counter((counter))
    a(a)
    b(b)
    c(c)
    a'(a)
    b'(b)

    p1 --> a
    a --> p2
    p2 --> b
    b --> p1
    b --> counter
    p1 --> a'
    a' --> p3
    p3 --> b'
    b' --> p4
    b' --> counter
    counter --> c
    p4 --> c
    c --> p4
~~~

# Exercise 3
## 3.1
~~~mermaid
graph LR;
    p1((p1 \n *))
    p2((p2))
    t1(t1)
    t2(t2)

    p1 --> t1
    t1 --> p2
    p2 --> t2
    t2 --> p2
~~~

## 3.2
~~~mermaid
graph LR;
    p1((p1 \n *))
    p2((p2))
    t1(t1)
    t2(t2)

    p1 -->|2| t1 --> p2
    p1 -->|2| t2 --> p2
~~~
## 3.3
~~~mermaid
graph LR;
    p1((p1 \n *))
    p2((p2 \n *))
    t1(t1)
    t2(t2)

    p1 --> t1
    t1 -->|2| p1
    p1 --> t2
    t2 --> p2
    p2 --> t2
~~~

## 3.4

# Exercise 4

# Extra exercises from lecture 1
## Extra 1
Find a petri net that is bounded, live, but not reversible.

~~~mermaid
graph LR;
    p((p \n *))
    b((bound \n *****))
    t1(t1)
    t2(t2)

    p --> t1
    t1 -->|2| p
    b --> t1
    p -->|5| t2
    t2 -->|3| b
    t2 -->|2| p
~~~

## Extra 2
Find a petri net that is stricly l2-live (every transition must be l2-live and at least on transition must not be l3-live).

~~~mermaid
graph LR;
    p1((p1 \n *))
    p2((p2))
    t1((t1))
    t2((t2))

    p1 --> t1 --> p1
    p1 --> t2
~~~

# Exercise 5
We add a transition counter i a place in which every transition adds a token.

# Exercise 6

## a
We modify the encoding of a minsky machine to a petri net with inhibitor arcs. By showing that we can encode any minsky machine, it shows that this extension allows the petri nets to be turing complete and thus reachability must be undeciable.

The counter places will now always contain one more token than the counter variables in the actual machine.

The increment instruction works the same way.

The test instruction now functions like the following.

~~~mermaid
graph LR;
    counter((counter \n *))
    pj((pj))
    pk((pk))
    pl((pl))

    tz(tz)
    tnz(tnz)

    pj --> tz --> pl
    counter --> tz --> counter

    pj --> tnz --> pk
    counter -->|2| tnz --> counter
~~~

We then add priority such that we always activate tnz before tz.

## b
Since the petri net is bounded we can simply enumerate the markings.

# Exercise 7
~~~mermaid
graph TD;
    0(1,0,0,0)
    01(1,w,0,0)
    011(1,w,0,0 \n old)
    012(0,w,1,0)
    0123(0,w,1,w)
    01233(0,w,1,w \n old)
    01234(0,w,1,w \n old)
    02(0,0,1,0 \n deadlock)

    0 -->|1| 01
    01 -->|1| 011
    01 -->|2| 012
    012 -->|3| 0123
    0123 -->|3| 01233
    0123 -->|4| 01234
    0 -->|2| 02

~~~

## a
Yes, if we reach any state $(x,y,z,v)$ such that $v=\omega$ then $p_4$ is unbounded.

## b
No, the tree only indicates that we can reach states that have at least as many tokens as showed in those in the nodes at least in the case of $\omega$.

# Exercise 8
~~~mermaid
graph LR;
    p((p \n *))
    t1(t1)
    t2(t2)
    t3(t3)

    t1 --> p
    p -->|2| t2
    p --o t3
~~~

# Exercise 9
~~~mermaid
graph LR;
    p1((p1))
    p2((p2))
    t1(t1)
    t2(t2)
    t3(t3)

    t1 --> p1
    p1 --> t2 --> p2
    p1 --> t3 --> p2
    p2 --> t3
~~~

# Exercise 10
~~~mermaid
graph LR;
    p((p))
    t1(t1)
    p --> t1 --> p
~~~

~~~mermaid
graph LR;
    t1(t1)
    p((p))
    t2(t2)
    p --> t1 --> p
    p -->|2| t2 -->|2| p
~~~

# Exercise 11
### a
Do not really know what he means by deadlock-freedom. If he means what we talked about in class then (f) can introduce deadlocks.

### b
It should be mentioned that none of the places removed cannot have tokens in the during the reduction process.

(a) should not introduce any problem.

(b) should not be a problem as the top token can not be action that brings the net to the initial marking, as it would contradict the fact that the place cannot have tokens in the initial marking.

(c) should not be a problem one of the two places is redundant, semantically.

(d) the two actions are equivalent semantically.

(e) The place is redundant.

(f) The action can be removed in this case, as it does not change the marking.

# Exercise 12
$1 = 0 - t_2$

$0 = 1 + 2t_2 - 4t_3$

$0 = 1 + t_2$

$0 = 0 + t_3 - 3t_4$

$t_1, t_2, t_3, t_4 \geq 0$

# Exercise 13
### a
Probably as we can say that a marking is definitely not reachable, so it is likely that we can do the same for coverability if we change the $=$ to $\leq$.

### b


### c

# Exercise 14
~~~mermaid
graph TD;
    i((input \n *))
    p1((p1))
    p2((p2))
    p3((p3))
    o((out))

    t1(t1)
    t2(t2)
    t3(t3)
    t4(t4)
    t5(t5)
    t6(t6)

    i --> t1
    t1 --> p1
    t1 --> p2

    p1 --> t2
    t2 --> p3

    p3 --> t3
    t3 --> p1

    p2 --> t4
    t4 --> p3

    p2 --> t5
    t5 --> p3

    p1 --> t6
    p3 --> t6
    t6 --> o
~~~

Use rule (c)

~~~mermaid
graph TD;
    i((input \n *))
    p1((p1))
    p2((p2))
    p3((p3))
    o((out))

    t1(t1)
    t2(t2)
    t3(t3)
    t4(t4/t5)
    t6(t6)

    i --> t1
    t1 --> p1
    t1 --> p2

    p1 --> t2
    t2 --> p3

    p3 --> t3
    t3 --> p1

    p2 --> t4
    t4 --> p3

    p1 --> t6
    p3 --> t6
    t6 --> o
~~~

Use rule (a)

~~~mermaid
graph TD;
    i((input \n *))
    p1((p1))
    p3((p3))
    o((out))

    t1(t1)
    t2(t2)
    t3(t3)
    t6(t6)

    i --> t1
    t1 --> p1
    t1 --> p3

    p1 --> t2
    t2 --> p3

    p3 --> t3
    t3 --> p1

    p1 --> t6
    p3 --> t6
    t6 --> o
~~~

coverability graph

~~~mermaid
graph TD;
    p1(i)
    p2(p1 + p3)
    p3(o)
    p4(2p3)
    p5(2p1)

    p1 -->|t1| p2
    p2 -->|t6| p3
    p2 -->|t2| p4
    p4 -->|t3| p2
    p2 -->|t3| p5
    p5 -->|t2| p2
~~~

We add the fresh transition $t$.

~~~mermaid
graph TD;
    i((input \n *))
    p1((p1))
    p3((p3))
    o((out))

    t1(t1)
    t2(t2)
    t3(t3)
    t6(t6)
    t(t)

    o --> t
    t --> i

    i --> t1
    t1 --> p1
    t1 --> p3

    p1 --> t2
    t2 --> p3

    p3 --> t3
    t3 --> p1

    p1 --> t6
    p3 --> t6
    t6 --> o
~~~

We will now argue that this new net is both live and bounded.

# Exercise 15
### a
No, as this would break the second condition is the definition a soundness, it would be possible to reach a marking where the out place has a token, but all other places are not empty.

### b
Yes, it would we can simply modify any transition adding tokens to the out place such that all other places should be empty. Of course there should also be transitions necessary to empty any possibly unbounded place.
