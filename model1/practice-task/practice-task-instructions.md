# Practice Task

## Specification of Operation

The operation `AddNodeAfter[net0, net1, n0, n1]` constrains `net1` to be the state after adding node `n0` as the successor to node `n1` in `net0`. It should not affect any data in the network.

For example, suppose `net0` consists of a ring network which has node `n1` and its successor `n1'`, arranged as follows:
```
... -> n1 -> n1' -> ...
```

If `AddNodeAfter[net0, net1, n0, n1]` holds, then in `net1`, `n0` should appear as the successor to `n1` and as the predecessor to `n1'`. State `net1` should be arranged as follows:
```
... -> n1 -> n0 -> n1' -> ...
```

## Visualizations

You will soon see two visualizations, one of network state `net0` and one of `net1`, which are related through
```
AddNodeAfter[net0, net1, Node0, Node1]
```
In other words, `net1` is the result of adding node `Node0` after `Node1` in `net0`.

The implementation of the operation `AddNodeAfter` contains a bug. Therefore, the diagrams you will see show an execution of this buggy version of `AddNodeAfter`. Your task is to use the diagrams to diagnose the bug.

**Please let the researchers know once you are ready to proceed. Do not proceed unless instructed.**

## Subtask 1: Identify the bug

**Instruction**: please read through this entire section titled `Subtask 1` to understand what you need to do.

You will soon see two diagrams, as specified above. Using the diagrams you will soon see, please **think about** the answers to the following prompt. You will have a chance to write down your answers afterwards.

```
Please identify the bug in the diagrams.
Describe the "phenomenon", not the "cause".
For example, which parts of the diagram exhibit the bug?
```

**Once you are ready to see the diagrams, please let the researchers know**. The researchers will tell you which diagrams to open. The timer for this question starts when both diagrams of `net0` and `net1` are opened.

**Once you have a satisfactory answer to the question in mind, please let the researchers know so we can stop the timer.**

Now, please open `question1.txt` and write down your responses to the above question in the file. Please write whatever answer you have reached when you were thinking about the answer, and then close the file. The timer starts when you open the file, and stops when you close the file.

## Subtask 2: Localize the bug

**Instruction**: please read through this entire section titled `Subtask 2` to understand what you need to do.

In this subtask, you will read the Alloy file containing the buggy operation implementation, which resulted in the diagrams you saw. The Alloy file is arranged into three parts: the static model specification, the invariants, and the buggy operations.

Using the diagrams you have seen in the previous subtask, as well as the Alloy file, please **think about** the answers to the following question prompt. As before, you will have a chance to write down your answers afterwards.

```
What is the bug in the implementation of the buggy operations?

Is the implementation missing something, or overspecifying something, or mis-specifying something? If so, what? Or is the bug something else?
```

**Once you are ready to start working on this question, please let the researchers know**. The researchers will tell you which Alloy file to open. The timer starts when the Alloy file is opened. 

**Once you have a satisfactory answer to the question in mind, please let the researchers know so we can stop the timer.**

Now, please open `question2.txt` and write down your responses to the above question in the file. Please write whatever answer you have reached when you were thinking about the answer, and then close the file. The timer starts when you open the file, and stops when you close the file.

## That's the end of the task!