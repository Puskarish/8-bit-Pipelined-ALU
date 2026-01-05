# 🚀 3-Stage Pipelined 8-bit ALU (Verilog HDL)

## ✨ Project Overview
This project implements a **3-stage pipelined 8-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**.  
The main focus is on **RTL design, pipelined datapath architecture, and functional verification using simulation**.

The design demonstrates how pipelining improves throughput by allowing **multiple instructions to be processed simultaneously** across different pipeline stages.

---

## 🎯 Project Objectives
- 🧠 Design a **pipelined ALU datapath**
- 🧩 Understand **pipeline stages and registers**
- 🛠 Implement the design using **Verilog RTL**
- 🧪 Verify correctness using a **custom testbench**
- 🔍 Observe **pipeline latency and overlapping execution** in simulation

---

## 🏗️ Architecture Overview

The ALU is divided into **three pipeline stages**, each separated by registers:

### 🔹 Stage 1 — Register Read 📥
- Reads operands from an internal **8-register register bank**
- Latches:
  - Operand A
  - Operand B
  - Opcode
  - Destination register
- Forms the **first pipeline boundary**

---

### 🔹 Stage 2 — Execute ⚙️
- Performs the ALU operation based on the opcode
- Supports arithmetic, logical, and shift operations
- Output and destination register are stored in pipeline registers

---

### 🔹 Stage 3 — Write-Back 📝
- Writes the result back to the destination register
- Output is also made available at the module output
- Completes one instruction per cycle (after pipeline fill)

---

## 🔢 Supported ALU Operations

| Opcode | Operation |
|------|----------|
| 0 | ➕ Addition |
| 1 | ➖ Subtraction |
| 2 | ✖️ Multiplication |
| 3 | 🔹 AND |
| 4 | 🔸 OR |
| 5 | ❌ XOR |
| 6 | 🔁 NOT A |
| 7 | 🔁 NOT B |
| 8 | 📤 Select A |
| 9 | 📤 Select B |
| 10 | ⏩ Shift Right |
| 11 | ⏪ Shift Left |

---

## 🧪 Verification Methodology

✔ A **custom Verilog testbench** was developed to verify functionality.  
✔ All ALU opcodes were tested under **continuous pipelined execution**.  
✔ Back-to-back instructions were applied every clock cycle.  

### 🔍 What was verified:
- ✅ Correct ALU operation
- ✅ Correct write-back behavior
- ✅ **3-cycle pipeline latency**
- ✅ Overlapping execution of instructions

---

## 📸 Simulation Evidence

The `docs/` directory contains visual and simulation-based artifacts used to
support the RTL design and verification of the pipelined ALU.

### 🧩 pipeline_architecture.png
A block-diagram style representation of the 3-stage pipelined ALU datapath.
It illustrates the flow of inputs from the register bank through the pipeline
stages (Register Read → Execute → Write-Back) up to the final output.

### 🧠 rtl_analysis/
Contains the RTL elaborated schematic generated from Vivado, showing the internal
structure of the design, pipeline registers, and datapath connections.

### 🧪 simulation/
Contains simulation evidence used for functional verification:
- `waveform.png` shows pipeline latency and overlapping instruction execution.
- `tcl_console_output.png` shows textual verification using `$monitor`.

These artifacts demonstrate **functional correctness at RTL level**.

---

## 📁 Repository Structure
```
8-bit-Pipelined-ALU/
│
├── rtl/
│ └── piped_alu.v # RTL design (3-stage pipelined ALU)
│
├── tb/
│ └── piped_alu_tb.v # Testbench for functional verification
│
├── docs/
│ ├── rtl_analysis/
│ │ └── rtl_schematic.png
│ │
│ ├── simulation/
│ │ ├── waveform.png
│ │ └── tcl_console_output.png
│ │
│ └── pipeline_architecture.png
│
└── README.md
```

---

## 🛠 Tools & Technologies Used
- 🧾 **Language:** Verilog HDL  
- 🧪 **Simulation:** Vivado Simulator (xsim)  
- 🧰 **Design Tool:** Xilinx Vivado  

---
This project **focuses strictly on RTL design and simulation-based verification**.
---

## 📚 Learning Outcomes
- 🌟 Strong understanding of **pipelined datapaths**
- 🧠 Practical experience with **Verilog RTL design**
- 🧪 Writing **pipeline-aware testbenches**
- 📊 Interpreting simulation outputs for pipelined systems

---

## ✅ Conclusion
This project successfully demonstrates the **design and verification of a 3-stage pipelined 8-bit ALU** using Verilog HDL.  
The design is **functionally correct**, well-structured, and verified through simulation, providing a solid foundation for future work in digital design and processor architectures.

---

## 👤 Author
**Puskar Raj**

---

⭐ *If you found this project useful or interesting, feel free to explore, fork, or give it a star!* ⭐

