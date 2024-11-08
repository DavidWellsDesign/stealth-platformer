extends Control

var deck : Array = ['CA','C2','C3','C4','C5','C6','C7','C8','C9','C10','CJ','CQ','CK',
'DA','D2','D3','D4','D5','D6','D7','D8','D9','D10','DJ','DQ','DK',
'HA','H2','H3','H4','H5','H6','H7','H8','H9','H10','HJ','HQ','HK',
'SA','S2','S3','S4','S5','S6','S7','S8','S9','S10','SJ','SQ','SK']

const SUITS: Dictionary = {'C':'Clubs','D':'Diamonds','H':'Hearts','S':'Spades'}
const NUMBERS: Dictionary = {'A':14,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'10':10,'J':11,'Q':12,'K':13}

func _ready():
	var hand : Array = [draw_card(), draw_card(), draw_card(), draw_card(), draw_card()]
	print(hand)
	
	for card in hand:
		var rank = card[1]  # Get the rank (number or face)
		var suit = card[0]   # Get the suit
		print(rank + ' of ' + SUITS[suit])
	
	var hand_type = evaluate_hand(hand)
	print("Hand type: " + hand_type)

func draw_card():
	var card = deck.pick_random()
	deck.erase(card)
	return card

func evaluate_hand(hand: Array) -> String:
	var rank_count: Dictionary = {}
	var suit_count: Dictionary = {}
	
	# Count ranks and suits
	for card in hand:
		var rank = card[1]  # Extract the rank (e.g., 'A', '2', '3', etc.)
		var suit = card[0]   # Extract the suit (e.g., 'C', 'D', 'H', 'S')
		
		rank_count[rank] = (rank_count.get(rank, 0) + 1)
		suit_count[suit] = (suit_count.get(suit, 0) + 1)
	
	var unique_ranks = rank_count.size()
	var unique_suits = suit_count.size()
	var max_count = rank_count.values().max()
	
	if unique_ranks == 5 and unique_suits == 1:
		return "Flush"
	# think this doesn't work as some values aren't numbers?
	# elif unique_ranks == 5 and is_consecutive(rank_count.keys()): 
		#return "Straight"
	elif max_count == 4:
		return "Four of a Kind"
	elif max_count == 3 and unique_ranks == 2:
		return "Full House"
	elif max_count == 3:
		return "Three of a Kind"
	elif max_count == 2 and unique_ranks == 3:
		return "Two Pair"
	elif max_count == 2:
		return "One Pair"
	elif unique_ranks == 5 and unique_suits == 1 and is_royal_flush(rank_count.keys()):
		return "Royal Flush"
	
	return "High Card"

func is_consecutive(ranks: Array) -> bool:
	var rank_values = []
	for rank in ranks:
		rank_values.append(NUMBERS[rank])
	rank_values.sort()
	
	for i in range(1, rank_values.size()):
		if rank_values[i] != rank_values[i - 1] + 1:
			return false
	
	return true

func is_royal_flush(ranks: Array) -> bool:
	var royal_ranks = ['10', 'J', 'Q', 'K', 'A']
	for rank in royal_ranks:
		if rank not in ranks:
			return false
	return true


func _on_button_button_down():
	print('He pressed it!')
