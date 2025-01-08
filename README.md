# Vending-Machine-Controller Design

This project implements a state machine for a Vending Machine Controller. The system has four states:

S0: Product Selection – The user selects a product.
S1: Payment – Accepts money in the form of coins, bills, or credit cards.
S2: Waiting for More Money – If the inserted money is insufficient, the machine waits for more.
S3: Dispense Product and Change – The machine dispenses the product and any change if needed.
The state transitions are based on inputs such as product selection, money inserted, and credit card usage. The controller ensures the correct amount is collected, and the product is dispensed with change, if applicable.

The design includes a state diagram, state table, VHDL code, testbench, and simulation waveforms for verification.
