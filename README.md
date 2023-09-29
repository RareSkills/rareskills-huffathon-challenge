# Welcome Players!

Greetings, Huffoor! This document will guide you through the steps to solve this challenge and register your solution.

## Overview

RareSkills x Huffathon

RareSkills is going back to our roots -- we are awarding cold hard crypto to the most elite optimizors.

Your goal is to compute the determinant of a matrix of integers (possibly negative) gas efficiently.

The algorithm you chose will have as much impact as your Huff skills.

Lowest gas takes the prize, but the winner will be decided on a hidden test case to discourage gaming the tests.

Some pointers:
- don't change the calldata signature -- assume we need to support large integers
- we will involve large matrices in the test, you should optimize for that
- the determinant of a matrix of integers is always an integer


Good luck.

 - Please only update the PLAYER_SOLUTION.huff and nothing else.
 - Also note, if you submit a hash and you decide to keep working on it (to optimize it more) be sure to retain your original code that goes with the hash you submitted.

## Getting Started

1. **Clone the Repo**: Start by cloning this repository to your local machine.

```bash
git clone <REPO_URL>
```

If you're considering sharing your solution later or want to track your progress with commits, consider forking this repository. However, remember to keep your fork private initially to prevent others from seeing your solution.

2. **Solve the Puzzle**: Dive into the [PLAYER_SOLUTION.huff](src/PLAYER_SOLUTION.huff) file and work your magic to solve the challenge.

3. **Testing**: While solving, you can utilize the test suite [Solution.t.sol](test/Solution.t.sol) to validate your solution. Feel free to make changes to this file; it won't affect the main challenge or your submission. It's just there to assist you.

## Registering Your Solution

Once you're confident in your solution, register it with the HuffCTFRegistry on Optimism mainnet:

1. **Set Up Your Discord Handle**: Before running the registration script, set up an environment variable with your Discord handle (without the '@' symbol):

```bash
export PLAYER_HANDLE=devtooligan
```

2. **Run the Registration Script**: Use the following command to run the registration script:

```bash
forge script script/Solution.s.sol:Register --rpc-url <OPTIMISM RPC URL> --broadcast -vvvv
```

Note:
- This command sends a live transaction on Optimism. Replace `<OPTIMISM RPC URL>` with a valid URL.
- You'll need to use an actual wallet for the transaction. You can specify your wallet using the `--wallet` flag. Alternatively, you can input your private key in other ways, such as by using the `--interactive` flag. See [Foundry documentation](https://book.getfoundry.sh/) for more information.


Also note:
- You can also interact directly with the Optimism [block explorer](https://optimistic.etherscan.io/address/0xf6aE79c0674df852104D214E16AC9c065DAE5896#writeContract). This is not the recommended way due to the danger of human error. If you want to see the exact input parameters you can run the Register script above and DO NOT use a private key.  The arguments will be console.logged for you.
## Wrapping Up

That's all there is to it! Once the challenge concludes, feel free to make your repository public. If your solution ranks among the top contenders, it will undergo a human review. Stay updated by keeping an eye on our Discord channel and Twitter feed.

## Credits
Credit to [devtooligan](https://github.com/devtooligan/) for porting this CTF to the contest format.

Best of luck, and may the best coder win!
