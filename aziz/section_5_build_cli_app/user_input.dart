import 'dart:io';

import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock, paper, scissors? Pick one (r, p, or s): ');
    var input = stdin.readLineSync();
    Move playerMove = Move.rock;

    if (input == 'r' || input == 's' || input == 'p') {
      switch (input) {
        case 'r':
          playerMove = Move.rock;
          break;
        case 'p':
          playerMove = Move.paper;
          break;
        case 's':
          playerMove = Move.scissors;
          break;
        default:
          print('Illegal move');
      }
      var random = rng.nextInt(3);
      var aiMove = Move.values[random];
      print('AiMove: $aiMove');

      String outcome = determineWinner(playerMove, aiMove);
      print(outcome);
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input');
    }
    print(input);
  }
}

String determineWinner(Move player, Move ai) {
  if (ai == player) {
    return 'No winner!';
  }

  if (player == Move.rock && ai == Move.scissors ||
      player == Move.paper && ai == Move.rock ||
      player == Move.scissors && ai == Move.paper) {
    return "You win!";
  } else {
    return "Ai wins";
  }
}

// switch ($VALUE$) {
//   case 'CLOSED':
//     executeClosed();
//     break;
//   case 'PENDING':
//     executePending();
//     break;
//   case 'APPROVED':
//     executeApproved();
//     break;
//   case 'DENIED':
//     executeDenied();
//     break;
//   case 'OPEN':
//     executeOpen();
//     break;
//   default:
//     executeUnknown();
// }
//
