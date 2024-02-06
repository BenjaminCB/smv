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
