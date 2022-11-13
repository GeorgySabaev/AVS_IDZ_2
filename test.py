import sys
import subprocess
import random

random.seed(1337)

for _ in range(100):
    symbols = "qwertyuiopasdfghjklzxcvbnm,,./p[]; 1234567890-=";
    input_ = "".join([symbols[random.randint(0, len(symbols)-1)] for i in range(2000)])
    f = open("input.txt", "w")
    f.write(input_)
    f.close()
    result1 = subprocess.run(
        [sys.argv[1],"input.txt"], capture_output=True, text=True
    )
    result2 = subprocess.run(
        [sys.argv[2],"input.txt"], capture_output=True, text=True
    )
    if (result1.stdout != result2.stdout):
        print("ERROR: OUTPUT DOES NOT MATCH")
        print("input:", input_)
        print("output1:", result1.stdout)
        print("output2:", result2.stdout)
        exit()
print("ALL TESTS PASSED, RESULTS IDENTICAL FOR BOTH PROGRAMS")

