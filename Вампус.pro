domains
  % ��� ���������� ��������� ������
  coord = c(integer, integer)    % ���������� ���� (X, Y)
  coordinates = coord*    % ������ ��������� �����
  direction = integer    % �����������
  dlist = direction*    % ������ �����������
  strench, breeze, glitter, scream, bump = integer    % �����, �������, �����, ����, ���� � �����
  bumps = direction*    % ������ ������ ����, ��� ���� �����
  sensors = s(strench, breeze, glitter, scream, bumps)    % ����� ��������
  wumpus, pit, gold = integer    % ������, ���, ������  

constants
  % �����������
  right = 1    % ������
  down = 2    % ����
  left = 3    % �����
  up = 4      % �����

facts - game_db  
  width(integer)  % ������ ������
  height(integer)  % ������ ������
  agent(coord, direction)  % ��������� ����� � ��������� ����������� �������� ������
  wumpus(coord)  % ������������ �������
  pit(coord)  % ���������� ���
  gold(coord)  % ���������� ���� � �������
  bump(coord, direction)  % ������ ������ - � ����� ������� �� ��������� ���� ������ �����
  strench(coord)  % ���������� �����, � ������� ����������� �����
  breeze(coord)  % ���������� �����, � ������� ����������� �������
  glitter(coord)  % ���������� ����, � ������� ����� ����� ������
  scream(integer)	% ������ ������ - ���� ������ �� ���� ����� ������, ������� ���������� ��� �� �����
  board_cells(coordinates)  % ������ ��������� ���� ����� ������
  board_edge_cells(coordinates)  % ������ ��������� �����, ����������� �� ����� ������
  board_corner_cells(coordinates)  % ���������� ����� �� ����� �������� ����

% ���� ������ ������
facts - agent_db
  agent_wumpus(coord)  % ���������� ����, � ������� ��������� ������ (���� ��� �������� ������)
  agent_pit(coord)  % ��������� ����, � ������� ������������� ���
  agent_gold(coord)    % ���������� ���� � �������
  maybe_wumpus(coord)  % ������������� ������ � ���, ��� � ���� ���� ��������� ������
  maybe_pit(coord)  % �� ������ ������ � ���� ���� ������������� ���
  agent_sensors(coord, sensors)  % ������ �������� � ����������� ����
  safe(coord)  % ��� � ����� ������������ ���������
  visited(coord)  % ��� ��� ����� ��� �������
  agent_bump(coord, direction)  % ������ ������ � ������� � ����� ������
  agent_has_gold(integer)  % � ������ �� ����� ���� ������ (1) ��� ��� (0)
  wumpus_dead(integer)  % 1 - ������ ����, 0 - ���-�� ��� �����
  agent_path(coordinates)	% ����, ������� ������ ����� � ������
    

predicates		
  % ������������� ����
  nondeterm init_game
  % ������������� ������
  nondeterm init_agent
  % ����������� ������� ����
  nondeterm show_game_db
  % ��������� �������
  nondeterm set_wumpus
  % ��������� ��
  nondeterm set_pits
  % ��������� ��� � ���������� ����
  nondeterm set_pit(coordinates)
  % ��������� ������
  nondeterm set_gold
  % ��������� ���� ����� ������: ������� � ���� ������ ���� ���������� � ���, ��� ������������� ������ ������
  nondeterm set_bumps
  % ... �� ������ ���� ������
  nondeterm set_bumps_left(coordinates)
  % ... �� ������� ���� ������
  nondeterm set_bumps_right(coordinates)
  % ... �� ������� ���� ������
  nondeterm set_bumps_down(coordinates)
  % ... �� �������� ���� ������
  nondeterm set_bumps_up(coordinates)
  % ������ ������ � ������� ����� � ����
  nondeterm set_bump(coord, direction)
  % ����������� ��������� ������� ������
  nondeterm set_strench(coordinates)
  % ����������� ��������� ������� �������
  nondeterm set_breeze(coordinates)
  % ��������� �������� ������� ������
  nondeterm set_glitter(coord)
  
  % ���� ����� � �������� ����?
  nondeterm is_strench(coord, strench)
  % ���� ������� � �������� ����?
  nondeterm is_breeze(coord, breeze)
  % ����� �� ����� � �������� ����?																
  nondeterm is_glitter(coord, glitter)
  % ������ �� ���� �������?
  nondeterm is_scream(scream)
  % ����� ����
  %is_bump(coord, bumps)  
  nondeterm is_bump(coord, bumps)
  
  
  
% ��������� ������
  % ������ ����
  nondeterm analyze_cell
  % �������� �� ����� �� ����� � ��� � ������� � �� ���� �� � ���
  nondeterm is_fail(coord)
  % ������ ��������� �������� � ����
  nondeterm analyze_sensors(coord, sensors)  
  % ������ ������� ������
  nondeterm analyze_strench(coord, strench)
  % ������ ������� �����
  nondeterm analyze_breeze(coord, breeze)
  % ������ ������� ������
  nondeterm analyze_glitter(coord, glitter)
  % ������ ������� �����
  nondeterm analyze_scream(coord, scream)
  % ������ ������� ����� � �����
  nondeterm analyze_bumps(coord, bumps)
  % ������������ ������ ������������� ����� �� ��������� ���� ������ ������
  nondeterm recheck_cell_list(coordinates, coordinates, string)
  % ������������ �������� �����
  nondeterm recheck_cell(coordinates, string)
  % ��������� ��������� ��������
  nondeterm get_sensors(coord, sensors)
  % ������� ��������� �������� �� ������� ������ (���� ����� ������� � ���� ����)
  nondeterm get_sensors_from_game_db(coord, sensors)
  % ������� ��������� �������� �� ���� ������ ������
  nondeterm get_sensors_from_agent_db(coord, sensors)
  % �������� ������ ��� ����������� � ���� ����������� ������
  nondeterm agent_set_strench(coordinates)
  % �������� ������ ��� ����������� � ���� �������
  nondeterm agent_set_breeze(coordinates)
  
  nondeterm set_safe_cells(coordinates)
  nondeterm set_unsafe_cells(coordinates)
  nondeterm assume_wumpus(coordinates)
  nondeterm assume_pit(coordinates)
  nondeterm show_agent_db
  nondeterm grab_gold
  nondeterm go_back(coordinates) % ����������� �����
  nondeterm is_agent_bump(coord, direction)
  % ���������� ���������� �����������
  %  - �� ������� ������� (0) ��� ������ (1)
  %  - ������� �����������
  %  - ����� �����������
  nondeterm next_direction(integer, direction, direction)
  % ������� �������
  nondeterm turnRight
  % ������� ������
  nondeterm turnLeft
  % �������� ��������� ���, ���� ����� �����
  nondeterm choose_next_cell
  % ���� ���������� ����� ���������, ������� ���� �� ���
  nondeterm choose_one_cell(coordinates, coord)
  % ���� ���������� ���������� ����, �������� ���� �� ������ ������������
  nondeterm turnIfNeed(coord, integer, coord) % ��������� - ���������� �������� ��������� ������, ��� �����������, ���������� ���������� ����
  % ��� ������
  nondeterm move_forward
  % ��������� ��������� ���������� ����
  nondeterm agent_next_cell(coord, direction, coord)
  
  % ����������� ����������� � ��������� ����
  nondeterm write_direction(direction)  
  % ����������� "������/������������" � ����������� �� ���� ��� �� ��� ����� � ���� ���� ��� ���
  nondeterm write_visited(coord)
  
  nondeterm menu
  nondeterm menu_choice(char)

% ��������������� ���������  
  equal(integer, integer)  % ��������� ����� �����: ������ �������� = ������� ���������
  equal(string, string)  % ��������� �����
  equal(char, char)  % ��������� ��������
  equal_list(bumps, bumps)	% ��������� ������ �����������, ��� ��������� �����
  between(integer, integer, integer) % �������� ��������� �� ������ ����� � ���������� ����� ������ � ������� �������
  nondeterm delta(char, direction, integer)

% ��������� ��� ������ �� ������� �����
  nondeterm on_board(coord)  % ��������� ���� �� � ������ ��� � ��������� ������������
  % ��� ���� ������ � ������������ ������ ���������� ����������� (0 - �� ������ ������� � ������� ��������, 1 - ��������)
  %  (�� �������� ������ ������ � ��� �������������)
  nondeterm cells_list(integer, coord, coordinates)
  % ��� ���� ������
  nondeterm all_cells(coordinates)
  % ��������� ��� (��� ������� �� ���� ����� ������)
  nondeterm next_cell(integer, coord, coord)
  % ���� � ���� ������
  nondeterm edge_cells(coordinates, coordinates)
  % ������� ���� ������
  nondeterm corner_cells(coordinates, coordinates)  
  % �������� ���� (� ����� ���� ������������ ����� ������� �� ��������� ����)
  nondeterm next_cells(coord, coordinates)
  % �������� ����, ������� ������� ���������� (� ������ ������ � ������ �������� ����)
  nondeterm only_board_cells(coordinates, coordinates)
  % �������� ����, ������� �� ������ ������ �������� �����������
  nondeterm next_safe_cells(coordinates, coordinates)
  
clauses
  init_game :-
    writef("������������� ����\n"),
    retractall(_, game_db), writef("... ������� ���� ������ ����\n"),
    assertz(width(4), game_db), writef("... ���������� ������ ������\n"),
    assertz(height(4), game_db), writef("... ���������� ������ ������\n"),
    assertz(agent(c(1, 1), right), game_db), writef("... ���������� ������ \n"),
    assertz(wumpus(c(1, 3)), game_db), writef("... ���������� ������� � ����� �� ����� ������\n"),
    assertz(pit(c(3, 1)), game_db),
    assertz(pit(c(3, 3)), game_db),
    assertz(pit(c(4, 4)), game_db), writef("... ���������� ���\n"),
    assertz(gold(c(2,3)), game_db), writef("... �������� ������\n"),
    set_wumpus, writef("... ���������� �������� �������� �������\n"),
    set_pits, writef("... ���������� �������� �������� ���\n"),
    set_gold, writef("... ���������� �������� ������� ������ � ����\n"),    
    assertz(scream(0), game_db), writef("... �������� ���� ���������� ����� - ������ ���� ���\n"),
    all_cells(BoardCells), writef("... ��������� ������ ���� ����� ������\n"),
    assertz(board_cells(BoardCells), game_db), writef("... ��������� ���� ������ ��� ����������� �������������\n"),
    edge_cells(BoardCells, EdgeCells), writef("... �������� �� ������ ������ ����� ��, ������� ��������� � ���� ������\n"),
    assertz(board_edge_cells(EdgeCells), game_db), writef("... ��������� ������ ������� ����� ��� ����������� �������������\n"),
    corner_cells(BoardCells, CornerCells), writef("... �������� �� ������ ������ ����� ��, ������� ��������� � ����� ������\n"),
    assertz(board_corner_cells(CornerCells), game_db), writef("... ��������� ������ ������� ����� ��� ����������� �������������\n"),
    set_bumps, writef("... ���������� ����� ������\n"),
    writef("�������� ������� ���� ���������\n\n").
  
  init_agent :-
    writef("\n������������� ������\n"),
    assertz(agent_has_gold(0), agent_db), writef("... � ������ ��� ������\n"),
    assertz(wumpus_dead(0), agent_db), writef("... ������ ���-�� � ������ ��� � ������\n"),
    agent(c(X, Y), _),
    % ������� � ���� ������ ������ ���
    assertz(agent_path([c(X, Y)])).
  
  show_game_db :-
    writef("\n������� ����:\n"),
    width(Width), height(Height),
    writef("  ������ �������� ���� %d, ������ - %d\n", Width, Height),
    agent(c(Xa, Ya), Direction), writef("  ����� �������� ���� � ���� � ������������ [%d.%d], ����������� - %d (", Xa, Ya, Direction), write_direction(Direction), writef(")\n"),
    wumpus(c(Xw, Yw)), writef("  ������ ��������� � ���� � ������������ [%d.%d]\n", Xw, Yw),
    gold(c(Xg, Yg)), writef("  ������ ��������� � ���� � ������������ [%d.%d]\n", Xg, Yg),
    glitter(c(Xgl, Ygl)), writef("  ������ ����� ������� � ���� � ������������ [%d.%d]\n", Xgl, Ygl),
    findall(Coord, pit(Coord), PitList), write("  ��� ����������� � ��������� �����: ", PitList), nl,
    findall(Coord, breeze(Coord), BreezeList), write("  ������� ����������� � ���� �����: ", BreezeList), nl,
    findall(Coord, strench(Coord), StrenchList), write("  ���������� ����� ��������� � ���� �����: ", StrenchList), 
    writef("\n\n******************************\n\n").
  
  % ����� �� ����� ���� ������ ������
  show_agent_db :-
    writef("\n���� ������ ������:\n"), 
    agent(c(X, Y), Direction),
    writef("  ������ ����� ��������� � ���� %d.%d � ������� ", X, Y), write_direction(Direction), nl,
    findall(Coord, visited(Coord), VisitedCells),
    write("  ���������� ����: ", VisitedCells), nl,
    findall(Coord, safe(Coord), SafeCells),
    write("  ���������� ����: ", SafeCells), nl,    
    findall(Coord, agent_wumpus(Coord), WumpusCells),
    write("  ����� �����, ��� ��� ��������� ������: ", WumpusCells), nl,
    findall(Coord, maybe_wumpus(Coord), MaybeWumpusCells),
    write("  ����� ������, ��� ��� ����� ���������� ������: ", MaybeWumpusCells), nl,
    findall(Coord, agent_pit(Coord), PitCells),
    write("  ����� �����, ��� � ���� ����� ����� ������������� ���: ", PitCells), nl,
    findall(Coord, maybe_pit(Coord), MaybePitCells),
    write("  ����� �����, ��� � ���� ����� �������� ������������� ���: ", MaybePitCells), nl.
%��������� ����������� � �� �����������    
  set_wumpus :-
    wumpus(c(X, Y)),
    retractall(strench(c(X, Y)), game_db),
    assertz(strench(c(X, Y)), game_db),
    next_cells(c(X, Y), NextCells),
    only_board_cells(NextCells, NextBoardCells),
    set_strench(NextBoardCells).
    
  set_strench([]) :- !.
  set_strench([c(X, Y)|T]) :-
    retractall(strench(c(X, Y)), game_db),
    assertz(strench(c(X, Y)), game_db),
    set_strench(T).
  
  set_pits :-
    findall(Coord, pit(Coord), PitsList),
    set_pit(PitsList).
  
  set_pit([]) :- !.
  set_pit([c(X, Y)|T]) :-
    retractall(pit(c(X, Y)), game_db),
    assertz(pit(c(X, Y)), game_db),
    next_cells(c(X, Y), NextCells), only_board_cells(NextCells, NextBoardCells),
    set_breeze(NextBoardCells),
    set_pit(T).
  
  set_breeze([]) :- !.
  set_breeze([c(X, Y)|T]) :-
    retractall(breeze(c(X, Y)), game_db),
    assertz(breeze(c(X, Y)), game_db),
    set_breeze(T).
  
  set_gold :-
    gold(c(X, Y)),
    set_glitter(c(X, Y)).
  
  set_glitter(c(X, Y)) :- 
    retractall(glitter(c(X, Y)), game_db),
    assertz(glitter(c(X, Y)), game_db).
  
  set_bumps :-
    %board_edge_cells(EdgeCells),
    board_cells(EdgeCells),    
    set_bumps_left(EdgeCells),    
    set_bumps_right(EdgeCells),
    set_bumps_down(EdgeCells),
    set_bumps_up(EdgeCells).

  set_bumps_left([]).
  set_bumps_left([c(1, Y)|T]) :-    
    set_bump(c(1, Y), left),
    set_bumps_left(T), !.
  set_bumps_left([_|T]) :-
    set_bumps_left(T).
  set_bumps_right([]).
  set_bumps_right([c(Width, Y)|T]) :-
    width(Width),
    set_bump(c(Width, Y), right),
    set_bumps_right(T), !.
  set_bumps_right([_|T]) :- 
    set_bumps_right(T).
  set_bumps_down([]).
  set_bumps_down([c(X, 1)|T]) :-
    set_bump(c(X, 1), down),
    set_bumps_down(T), !.
  set_bumps_down([_|T]) :-
    set_bumps_down(T).
  set_bumps_up([]).
  set_bumps_up([c(X, Height)|T]) :-
    height(Height),
    set_bump(c(X, Height), up),
    set_bumps_up(T), !.
  set_bumps_up([_|T]) :-
    set_bumps_up(T).

  set_bump(c(X, Y), Direction) :-    
    retractall(bump(c(X, Y), Direction), game_db),
    assertz(bump(c(X, Y), Direction), game_db).
	
	write_visited(c(X, Y)) :-
		visited(c(X, Y)), write("������������").
	write_visited(_) :-
		write("������").
	
	% ������, ����� ����� ����� � ���, ��� ��������� ������, ��� � ��� � ����
	is_fail(c(X, Y)) :-
		wumpus(c(X, Y)),
		writef("\n\tO, ����!\n\t����� ����� � ��� %d.%d, � ��� ������\n\t����� �����\n\t���� �������� :(\n\n", X, Y),
		% ����� ����
		exit.
	is_fail(c(X, Y)) :-
		pit(c(X, Y)),
		writef("\n\t����������!\n\t����� ���������� � ��� � ���� %d.%d\n\t����� �����\n\t���� �������� :(\n\n", X, Y),
		% ����� ����
		exit.
	
	% ����������� ���, � ������� ����� �����
  analyze_cell :-
    agent(c(X, Y), _Direction),
    writef("\n[analyze_cell]\t����� "), write_visited(c(X, Y)), writef(" � ��� %d.%d\n", X, Y), 
    not(is_fail(c(X, Y))),
    get_sensors(c(X, Y), s(Strench, Breeze, Glitter, Scream, Bump)),
    writef("[analyze_cell]\t���������� �������� � ���� %d.%d: ����� - %d, ������� - %d, ����� - %d, ���� - %d, ����� - ", X, Y, Strench, Breeze, Glitter, Scream), write(Bump), nl,
    retractall(visited(c(X, Y)), agent_db),
    assertz(visited(c(X, Y)), agent_db),
    writef("[analyze_cell]\t����� ����������� ���������� ��������\n"),
  	analyze_sensors(c(X, Y), s(Strench, Breeze, Glitter, Scream, Bump)),
  	writef("[analyze_cell]\t������� ��������� �������� ��������\n").
  
  set_safe_cells([]) :- !.
  set_safe_cells([c(X, Y)|T]) :-
    set_safe_cells(T),
    retractall(safe(c(X, Y)), agent_db),
    assertz(safe(c(X, Y)), agent_db), 
    retractall(maybe_wumpus(c(X, Y)), agent_db),
    retractall(maybe_pit(c(X, Y)), agent_db).
  
  set_unsafe_cells([]) :- !.
  set_unsafe_cells([c(X, Y)|T]) :-
    set_unsafe_cells(T),
    retractall(safe(c(X, Y)), agent_db).
  	
  % ������������� - � ���� ��������� ������
  assume_wumpus([]) :- !.
  assume_wumpus([c(X, Y)|T]) :-
    assume_wumpus(T),
    % ��������, � �� ������ �� �� �����, ��� ���� ��� ���������
    not(safe(c(X, Y))),    
    retractall(maybe_wumpus(c(X, Y)), agent_db),
    assertz(maybe_wumpus(c(X, Y)), agent_db),
    writef("[assume_wumpus]\t��� %d.%d �������, ��� ��������� ������������ �������\n", X, Y).
  % ���� ����� �� ������, ��� ���� ��� ���������, ������ � �� �� ����� ��������� ������
  assume_wumpus([c(X, Y)|T]) :- 
    assume_wumpus(T),
    safe(c(X, Y)).
    
  % ������������� - � ���� ������������� ���
  assume_pit([]) :- !.
  assume_pit([c(X, Y)|T]) :-
    assume_pit(T),
    % ��������, � �� ������ �� �� �����, ��� ���� ��� ���������
    not(safe(c(X, Y))),
    retractall(maybe_pit(c(X, Y)), agent_db),
    assertz(maybe_pit(c(X, Y)), agent_db),
    writef("[assume_pit]\t��� %d.%d �������, ��� ��������� ������������ ���\n", X, Y).
  % ���� ����� �� ������, ��� ���� ��� ���������, ������ � �� �� ����� ������������� ���
  assume_pit([c(X, Y)|T]) :-
    assume_pit(T),
    safe(c(X, Y)).
  
  % ���� ������
  grab_gold :-
    agent(c(X, Y), _),
    retractall(agent_gold(_), agent_db),
    assertz(agent_gold(c(X, Y)), agent_db),
    retractall(agent_has_gold(_), agent_db),
    assertz(agent_has_gold(1), agent_db),
    writef("[grab_gold]\t����� ���� ������!\n\n����� ������� ���� ������� - ���� �� ����� ������\n"),
    agent_path(Path),
    go_back(Path).

	% ����������� � ������ �� ������, �� ��������� ����, ����������� �������
  go_back([c(X, Y)|T]) :-
		agent(c(X, Y), _),
		writef("\n���� �������:\n\t�� ���� %d.%d ����� ��� � ��� ", X, Y),
		go_back(T).
	% ����� ������ � ��� 1.1, ����� ��������� ����� ���� ������
	go_back([c(1, 1)|_]) :-
		writef("%d.%d - ��� ����� � �������� � ������� � ������ �� ������!\n\n���� ������� ���������\n\n", 1, 1),
		exit.
	% ����������� ���� �� ���� ������
	go_back([c(X, Y)|T]) :-
		writef("%d.%d,\n\t����� � ��� ", X, Y),                                                                                                                                                     
		go_back(T).
  
  % ���������� ���������� �����������
  %  ������������ �� ������� �������
  next_direction(0, Direction, NextDirection) :-
  	NextDirection = (Direction mod 4) + 1, !.
  %  ������������ ������ ������� �������
  next_direction(1, Direction, NextDirection) :-
  	Direction > 1,
  	NextDirection = Direction - 1, !.
  % ��� �������� ����������� right (1) ��������� ��������
  next_direction(1, 1, 4).
  
  % �������... �� ������� �������
  turnRight :-
  	writef("[turnRight]\t����� ���������� ��������� ������\n"),
  	agent(c(X, Y), Direction),
  	next_direction(0, Direction, DirectionNew),
  	retractall(agent(c(X, Y), Direction), game_db),
  	assertz(agent(c(X, Y), DirectionNew), game_db),
  	writef("[turnRight]\tA���� � ���� %d.%d ����������� ������� � ������ ������� ", X, Y), write_direction(DirectionNew), nl.
  % ... ������ ������� �������
  turnLeft :-
  	writef("[turnLeft]\t����� ���������� ��������� �����\n"),
  	agent(c(X, Y), Direction),
  	next_direction(1, Direction, DirectionNew),
  	retractall(agent(c(X, Y), Direction), game_db),
  	assertz(agent(c(X, Y), DirectionNew), game_db),
  	writef("[turnLeft]\tA���� � ���� %d.%d ����������� ������ � ������ ������� ", X, Y), write_direction(DirectionNew), nl.
  	
  % �������� ��������� ���, ���� ����� �����
  choose_next_cell :-
  	writef("[choose_next_cell]\t����� �������� ��������� ���\n"),  	                 														
  	agent(c(X, Y), Direction),	% �������, ��� ������ �����
  	agent_next_cell(c(X, Y), Direction, c(X1, Y1)), % �������� ���, ���� ����� ����� �������, �������� � ��� �� �����������
  	% ����������� �� �������� � ����� ���������� ����
  	not(visited(c(X1, Y1))),
  	writef("[choose_next_cell]\t...�������� ������������ ���������� ���� %d.%d\n", X1, Y1),
  	safe(c(X1, Y1)), % ���� ��������� ��� ���������
  	writef("[choose_next_cell]\t��� ������� ��������� - ����� ������ ��� %d.%d\n", X1, Y1), !.
 	% ���� ������� ��� ���������� ���, ����� ��������� ����� ������ 
  choose_next_cell :-
  	agent(c(X, Y), Direction),	% �������, ��� ������ �����
  	% ��������� ���������� �������� �����
  	next_cells(c(X, Y), NextCells),
  	write("[choose_next_cell]\t������ �������� �����: ", NextCells), nl,
  	% ��������� ������ ���������� �� ������ ������ ����
  	next_safe_cells(NextCells, NextSafeCells),
  	write("[choose_next_cell]\t�� ��� ����������: ", NextSafeCells), nl,
  	% ���� �� ���������, �������� ����
  	choose_one_cell(NextSafeCells, c(Xn, Yn)),
  	writef("[choose_next_cell]\t����� ������ ��� %d.%d\n", Xn, Yn), 
  	turnIfNeed(c(X, Y), Direction, c(Xn, Yn)), 
  	!.
  % ���� ��������� ���� �����������, ������ � ���� ��������
	choose_next_cell :-  	
  	writef("[choose_next_cell]\t��� ������� �����������. ���������� �������� ������ �������\n"),
  	agent(c(X, Y), Direction),
		% ��������� ���������� �������� �����
  	next_cells(c(X, Y), NextCells),
  	write("[choose_next_cell]\t������ �������� �����: ", NextCells), nl,
  	% ��������� ������ ���������� �� ������ ������ ����
  	next_safe_cells(NextCells, NextSafeCells),
  	write("[choose_next_cell]\t�� ��� ����������: ", NextSafeCells), nl,
  	% ���� �� ���������, �������� ����
  	choose_one_cell(NextSafeCells, c(Xn, Yn)),
  	writef("[choose_next_cell]\t����� ������ ��������� ��� - %d.%d\n", Xn, Yn),
  	% ��������� ���������� �� ������ ������������, ����� ������� � ��������� ���
  	turnIfNeed(c(X, Y), Direction, c(Xn, Yn)).  	
  
  % ���� ��� ���� ��� ����������, ����� ������� ��������� �� ������
  choose_one_cell([c(X, Y)|[]], c(X, Y)).
  % ���� ���������� ����� ���������, ������� ���� �� ���
  choose_one_cell([c(X, Y)|_], c(X, Y)) :-
  	% ��������� ���, � ������� �� ��� �� ����
  	not(visited(c(X, Y))).
  % ���� ����� ���������� ���, ��������� ��������� ��� �� ������
  choose_one_cell([_|T], c(Xn, Yn)) :-
  	choose_one_cell(T, c(Xn, Yn)).  
  
  turnIfNeed(c(X, Y), _, c(X, Y)) :- !.
  turnIfNeed(c(Xa, Ya), Direction, c(Xn, Yn)) :-
  	% ��������� ��� ������� ����������� �������� ������ �� ����� � ��������� ���
  	writef("[turnIfNeed]\t��������, ���� �� ������ ������������, ����� ������� �� ���� %d.%d � ��� %d.%d, �������� ", Xa, Ya, Xn, Yn), write_direction(Direction), nl,
  	agent_next_cell(c(Xa, Ya), Direction, c(Xn, Yn)), 
  	writef("[turnIfNeed]\t����� ���� �����\n"), !.
  % ���� �� ������ - ����� ���������������  
  turnIfNeed(_, _, c(Xn, Yn)) :-  
  	writef("[turnIfNeed]\t���������� ���������\n"),
  	turnRight,
  	agent(c(Xa1, Ya1), Direction1),
  	turnIfNeed(c(Xa1, Ya1), Direction1, c(Xn, Yn)).  	
  
	% ��������� ����������� ��������� ��������� �� ����������� ��������
	%  ��� ���������� X
  delta('X', 1, 1). % ������ - ���������� X �������������
  delta('X', 3, -1). % ����� - ���������� X �����������  
  delta('X', _, 0). % ��� ����������� ����� � ���� - ������ = 0
 	%  ��� ���������� Y
  delta('Y', 2, -1) :- !.
  delta('Y', 4, 1) :- !.
  delta('Y', _, 0).
  	
  % ��������� ��������� ���������� ����  
  agent_next_cell(c(X, Y), Direction, c(Xn, Yn)) :-
  	not(is_agent_bump(c(X, Y), Direction)),
  	delta('X', Direction, Dx), 
  	delta('Y', Direction, Dy),
  	Xn = X + Dx, 
  	Yn = Y + Dy, !.
  % ���� ����� ������ � �����, ������� �� ����
	agent_next_cell(c(X, Y), Direction, c(Xn, Yn)) :-
		agent(c(X, Y), Direction),
		is_agent_bump(c(X, Y), Direction),
		writef("[agent_next_cell]\t...����� �� ����� ���� �� ���� %d.%d ", X, Y), write_direction(Direction), writef(" - ������� �����\n"),
		retractall(agent_bump(c(X, Y), Direction), agent_db),
		assertz(agent_bump(c(X, Y), Direction), agent_db), 
		turnRight,
		agent(c(Xa, Ya), DirectionA),
		agent_next_cell(c(Xa, Ya), DirectionA, c(Xn, Yn)).
	% ����� - ������ ������� ��� ���� �������
	agent_next_cell(_, _, c(Xn, Yn)) :-
		turnRight,
		agent(c(Xa, Ya), DirectionA),
		agent_next_cell(c(Xa, Ya), DirectionA, c(Xn, Yn)).
  
  % �������� ������
  move_forward :-
  	writef("[move_forward]\t����� ������������ ������\n"),
  	agent(c(X, Y), Direction),
  	agent_next_cell(c(X, Y), Direction, c(Xn, Yn)),  	
  	retractall(agent(c(X, Y), Direction), game_db),
  	assertz(agent(c(Xn, Yn), Direction), game_db), 
  	
  	agent_path(Path),
  	NewPath = [c(Xn, Yn)|Path],
  	retractall(agent_path(_), agent_db),
  	
  	assertz(agent_path(NewPath), agent_db),
  	writef("[move_forward]\t����� ������� �� ���� %d.%d � ��� %d.%d\n", X, Y, Xn, Yn), !.
  
  % ����� ���, ��� ����������� ��� � ���, ��� � �� ���� ��� ��� ������
  %  ��������� ��������� �������� ���������� ������ �� ������� � ��� ��������������� ��������� - ������� � ������
  recheck_cell_list([], [], _).
  recheck_cell_list([c(X, Y)|T1], [c(X, Y)|T], Param2Check) :-
  	next_cells(c(X, Y), NextCells2Check),
  	not(recheck_cell(NextCells2Check, Param2Check)),
  	recheck_cell_list(T1, T, Param2Check).
  recheck_cell_list([c(X, Y)|T1], T, Param2Check) :-
  	writef("[recheck_cell_list]\t��� %d.%d �� ������ ������������, ������� ������� ��� ��� ����������\n", X, Y),
  	set_safe_cells([c(X, Y)]),
  	recheck_cell_list(T1, T, Param2Check).
  
  % ���� ����� �������� ���� ���� ���� ���������� ���, � ������� �� ������������ �����, ����� ����� ��� ���� �������� ����������  
  recheck_cell([c(X, Y)|_], "Strench") :-
  	visited(c(X, Y)), not(is_strench(c(X, Y), 1)), 
  	writef("[recheck_cell]\t����� ��� ��� � ���� %d.%d � �� ������������ ��� ������ - ����� �� ����� ���������� ������\n", X, Y).
  recheck_cell([c(X, Y)|_], "Breeze") :-
  	visited(c(X, Y)), not(is_breeze(c(X, Y), 1)), 
  	writef("[recheck_cell]\t����� ��� ��� � ���� %d.%d � �� ������������ ��� ������� - ����� �� ����� ���� ���\n", X, Y).
  recheck_cell([_|T], Param2Check) :-  	
  	recheck_cell(T, Param2Check).
  	
  
  % ���� ������
  analyze_sensors(c(X, Y), s(_, _, 1, _, _)) :-
    writef("\n[analyze_sensors, Glitter]\t� ���� %d.%d ����� ������ ������\n\t���!!!\n\t����� ����� ������!!!\n\t����� ����� ��� � ������������ � �������� ����\n\n", X, Y),
    grab_gold.
  % ��� �� ������, �� �������
  analyze_sensors(c(X, Y), s(0, 0, _, _, _)) :-
    next_cells(c(X, Y), NextCells), 
    writef("[analyze_sensors]\t� ���� %d.%d �� ����������� �� �����, �� ������� - ������ �������� ���� ", X, Y), write(NextCells), writef(" ���������\n"),
    % ������, � ������� ��������� �����, ���������
    set_safe_cells([c(X, Y)]),
    % �������� ������ ���� ���������
    set_safe_cells(NextCells).  
  % ���� �����
  analyze_sensors(c(X, Y), s(1, _Breeze, _Glitter, _Scream, _Bumps)) :-
    next_cells(c(X, Y), NextCells), 
    next_safe_cells(NextCells, NextSafeCells),
    writef("[analyze_sensors, Strench]\t� ���� %d.%d ����������� ����� - ������ ���-�� � ����� �� �������� ����� ", X, Y), write(NextCells), writef(" ��������� ������!\n"),
    writef("[analyze_sensors, Strench]\t�� �� ��������� ���������� ������������ ����� �����, ��� ��� ���� ���������: "), write(NextSafeCells), nl,
    % ������������ �������������, ����������� � ���� ������ ������
    recheck_cell_list(NextCells, NextCells2, "Strench"),
    % ������� �������������, ��� � ���� ����� ��������� ������
    writef("[analyze_sensors]\t������� ��������� ����, ��� ��������� ������������ �������: "), write(NextCells2), nl,
    assume_wumpus(NextCells2).
  % ���� �������
  analyze_sensors(c(X, Y), s(_Strench, 1, _Glitter, _Scream, _Bumps)) :-
    next_cells(c(X, Y), NextCells), 
    next_safe_cells(NextCells, NextSafeCells),
    writef("[analyze_sensors, Breeze]\t� ���� %d.%d � �������� ������� - ������ ���-�� � ����� �� �������� ����� ", X, Y), write(NextCells), writef(" ������������� ���!\n"),
    writef("[analyze_sensors, Breeze]\t�� �� ��������� ���������� ������������ ����� �����, ��� ��� ���� ���������: "), write(NextSafeCells), nl,
    % ������������ �������������, ����������� � ���� ������ ������
    recheck_cell_list(NextCells, NextCells2, "Breeze"),
    % ������� �������������, ��� � ���� ����� ��������� ���
    writef("[analyze_sensors]\t������� ��������� ����, ��� ��������� ������������ ���: "), write(NextCells2), nl,
    assume_pit(NextCells2).  
  % ������ ���� �������
  analyze_sensors(c(X, Y), s(_, _, _, 1, _)) :-
    writef("[analyze_sensors, Scream]\t�������� � ���� %d.%d � ����� ��� ������ ������, ������ �� ����. ���! ������ �� ������ ����� ����������\n", X, Y),
		% �������� ���������� �� ���� �������
		retractall(wumpus_dead(_), agent_db),
		assertz(wumpus_dead(1), agent_db),
		% ����� ������� ���������� � ����� - ��� ����� ������ ���� ���
		retractall(scream(_), game_db).
	analyze_sensors(c(X, Y), s(_, _, _, _, Bumps)) :-
		not(equal_list(Bumps, [])),
		agent(c(X, Y), Direction),
		writef("[analyze_cells, Bump]\t�����: ��������� ����� � ���� %d.%d ", X, Y), write_direction(Direction), writef(" � ��������� �� ����� - ���� ���������\n"),
		turnRight.

  analyze_sensors(c(X, Y), s(Strench, Breeze, Glitter, Scream, Bumps)) :-  	
    analyze_strench(c(X, Y), Strench),
    analyze_breeze(c(X, Y), Breeze),
    analyze_glitter(c(X, Y), Glitter),
    analyze_scream(c(X, Y), Scream),
    analyze_bumps(c(X, Y), Bumps), !.
  
  analyze_strench(c(X, Y), 1) :-
    next_cells(c(X, Y), NextCells),
    agent_set_strench(NextCells).
  analyze_strench(_, 0).
  
  analyze_breeze(c(X, Y), 1) :-
  	next_cells(c(X, Y), NextCells),
  	agent_set_breeze(NextCells).
  analyze_breeze(_, 0).
  
  analyze_glitter(c(X, Y), 1) :-
  	writef("[analyze_glitter]\t���! ����� ����� ������ � ���� %d.%d\n����� ������������ �����\n", X, Y).
  analyze_glitter(_, 0).

  analyze_scream(c(X, Y), 1) :-
  	writef("[analyze_scream]\t����� ��������� � ���� %d.%d � ������ ��� ������ ������ - ������ ����!\n", X, Y).  
  analyze_scream(_, 0).

	analyze_bumps(_, []).
  analyze_bumps(c(X, Y), [Bump|T]) :- 
  	writef("[analyze_bumps]\t� ���� %d.%d ����� ���������� �� �����, �������� ", X, Y), write_direction(Bump), nl,
  	analyze_bumps(c(X, Y), T).
  
  agent_set_strench([]) :- !.
  agent_set_strench([c(X, Y)|T]) :-
    % ���� �� �������, ��� �������� ��� ���������
    not(safe(c(X, Y))),
    % ����� ������� �������������, ��� ��� ��������� ������
		retractall(maybe_wumpus(c(X, Y)), agent_db),
		assertz(maybe_wumpus(c(X, Y)), agent_db),
		agent_set_strench(T).
	
	agent_set_breeze([]) :- !.
	agent_set_breeze([c(X, Y)|T]) :-
		% ���� �� �������, ��� �������� ��� ���������
    not(safe(c(X, Y))),
    % ����� ������� �������������, ��� ��� ������������� ���
		retractall(maybe_pit(c(X, Y)), agent_db),
		assertz(maybe_pit(c(X, Y)), agent_db),
		agent_set_breeze(T).
  
  get_sensors(c(X, Y), Sensors) :-
    not(visited(c(X, Y))),
    get_sensors_from_game_db(c(X, Y), Sensors), !.
    
  get_sensors(c(X, Y), Sensors) :- 
  	get_sensors_from_agent_db(c(X, Y), Sensors).
  
  is_strench(c(X, Y), 1) :- strench(c(X, Y)), !.
  is_strench(_, 0).

  is_breeze(c(X, Y), 1) :- breeze(c(X, Y)), !.
  is_breeze(_, 0).
  
  is_glitter(c(X, Y), 1) :- glitter(c(X, Y)), !.
  is_glitter(_, 0).
  
  is_scream(Scream) :- scream(Scream).
  
  is_bump(c(X, Y), []) :- 
  	findall(Direction, bump(c(X, Y), Direction), Bumps), 
    equal_list(Bumps, []), !.
  is_bump(c(X, Y), Bumps) :-
    findall(Direction, bump(c(X, Y), Direction), Bumps).     
  is_agent_bump(c(X, Y), Direction) :-
  	bump(c(X, Y), Direction).
  is_agent_bump(c(X, Y), Direction) :-
  	agent_bump(c(X, Y), Direction).
  
  get_sensors_from_game_db(c(X, Y), s(Strench, Breeze, Glitter, Scream, Bump)) :-
    is_strench(c(X, Y), Strench),
    is_breeze(c(X, Y), Breeze),
    is_glitter(c(X, Y), Glitter),
    is_bump(c(X, Y), Bump),
    is_scream(Scream).
  
  get_sensors_from_agent_db(c(X, Y), s(Strench, Breeze, Glitter, Scream, Bump)) :-
    % ������ ������ �� ���� ������ ����
    get_sensors_from_game_db(c(X, Y), s(Strench, Breeze, Glitter, Scream, Bump)).
    
	% ����������� ����������� �������� � ��������� ����
	write_direction(1) :- write("������"), !.
	write_direction(2) :- write("����"), !.
	write_direction(3) :- write("�����"), !.
	write_direction(4) :- write("�����"), !.
	

  % �������� ��������� (��� ����� ����� � �����)
  equal(X, X).
  % ... ��� �������
  equal_list([], []).
  equal_list([X|T1], [X|T2]) :- equal_list(T1, T2).

  % �������� ��������� �� ����� 
  between(A, B, C) :- A >= B, A <=C.

% ��������� ��� ������ �� ������� �����
  % �������� ���� �� ��� � ��������� ������������ � ������
  on_board(c(X, Y)) :-    
    width(Width), height(Height),
    between(X, 1, Width),
    between(Y, 1, Height).
  
  % �������� ���� (������������ ���������)
  next_cells(c(X, Y), NextCells) :-
    X1 = X - 1, X2 = X + 1, Y1 = Y - 1, Y2 = Y + 1,
    NC1 = [c(X1, Y)], NC2 = [c(X2, Y)|NC1], NC3 = [c(X, Y1)|NC2],
    NextCells = [c(X, Y2)|NC3].
  
  % ��������� ��� �� ���� ���� � ������
  only_board_cells([], []) :- !.
  only_board_cells([c(X, Y)|T1], [c(X, Y)|T2]) :-
    on_board(c(X, Y)),
    only_board_cells(T1, T2), !.
  % ���� ���� ��� � ������, �������� � ���� ��������
  only_board_cells([_|T1], T2) :-
    only_board_cells(T1, T2).  
  
  % �������� ����������, �� ������ ������, ���� �� ������
  next_safe_cells([], []) :- !.
  next_safe_cells([c(X, Y)|T1], [c(X, Y)|T2]) :-
  	safe(c(X, Y)), not(maybe_wumpus(c(X, Y))), not(maybe_pit(c(X, Y))),
  	next_safe_cells(T1, T2), !.
  % ���� ��� �� ���������, �������� � ���� ��������
  next_safe_cells([_|T1], T2) :-
  	next_safe_cells(T1, T2).
  
    
  next_cell(0, c(X, Y), c(Xnext, Y)) :-
    width(Width), Xnext = X + 1, Xnext <= Width.
  next_cell(0, c(X, Y), c(Xnext, Ynext)) :-
    width(Width), height(Height), Xtemp = X + 1, Xtemp > Width, Xnext = 1, Ynext = Y + 1,  Ynext <= Height.
  next_cell(0, c(Width, Height), c(0, 0)) :-
    width(Width), height(Height).
  next_cell(1, c(X, Y), c(Xnext, Y)) :-
    width(Width), Xnext = X + 1, Xnext <= Width.
  next_cell(1, c(X, Y), c(Xnext, Ynext)) :-
    width(Width), Xtemp = X + 1, Xtemp > Width, Xnext = 1, Ynext = Y - 1,  Ynext >= 1.
  next_cell(1, c(Width, 1), c(0, 0)) :-
    width(Width).
    
  cells_list(0, c(X, Y), [c(X, Y)]) :- 
    next_cell(0, c(X, Y), c(0, 0)), !.
  cells_list(0, c(X, Y), [c(X, Y)|T]) :-
    next_cell(0, c(X, Y), c(Xn, Yn)),
    cells_list(0, c(Xn, Yn), T).
  cells_list(1, c(X, Y), [c(X, Y)]) :- 
    next_cell(1, c(X, Y), c(0, 0)), !.
  cells_list(1, c(X, Y), [c(X, Y)|T]) :-
    next_cell(1, c(X, Y), c(Xn, Yn)),
    cells_list(1, c(Xn, Yn), T).  
    
  all_cells(CellsListDown) :- 
    height(Height),
    cells_list(1, c(1, Height), CellsListDown).
    
  edge_cells([c(X, Y)|T1], [c(X, Y)|T]) :-
    height(Height), equal(X, 1), not(equal(Y, 1)), not(equal(Y, Height)), edge_cells(T1, T);
    width(Width), height(Height), equal(X, Width), not(equal(Y, 1)), not(equal(Y, Height)), edge_cells(T1, T);
    width(Width), equal(Y, 1), not(equal(X, 1)), not(equal(X, Width)), edge_cells(T1, T);
    width(Width), height(Height), equal(Y, Height), not(equal(X, 1)), not(equal(X, Width)), edge_cells(T1, T), !.
  edge_cells([_|T1], T) :-
    edge_cells(T1, T).
  edge_cells([], []).
  
  corner_cells([c(X, Y)|T1], [c(X, Y)|T]) :-
    equal(X, 1), equal(Y, 1), corner_cells(T1, T);
    width(Width), height(Height), equal(X, Width), equal(Y, Height), corner_cells(T1, T);
    width(Width), equal(Y, 1), equal(X, Width), corner_cells(T1, T);
    height(Height), equal(Y, Height), equal(X, 1), corner_cells(T1, T), !.
  corner_cells([_|T1], T) :-
    corner_cells(T1, T).
  corner_cells([], []).
  
  menu :-
  	writef("\n___________\n ���� ����:\n"),
  	writef("\t1 - ��������� ���\n\t2 - �������� ���� ������ ������\n\n\t0 - ����� �� ����\n"),
  	writef("��� �����: "), readchar(Choice), write(Choice), writef("\n~~~~~~~~~~~\n\n"), menu_choice(Choice).
    
  menu_choice('1') :- choose_next_cell, move_forward, analyze_cell, menu.
 	menu_choice('2') :- show_agent_db, menu.
 	menu_choice('0') :- writef("\n\n���� ��������\n�� ����� ������\n"), exit.
 	menu_choice(_) :- writef("��������, ����������, ���� �� ������������ ���������\n"), menu.	
  
goal
  init_game,
  init_agent,
  show_game_db,
  writef("\n�������� ����\n"),
  analyze_cell,
  menu,
  !, fail.