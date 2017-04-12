class PeopleJson

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def as_json(opts = {})
    {
      columns: columns,
      rows:    rows,
      people:  people_json
    }
  end

  def people_json
    index = -1
    Person.by_name.map do |person|
      visible = person.id.in?(game.possible_ids)
      index += 1 if visible

      {
        id:      person.id,
        url:     "http://localhost:3000/images/#{person.slug}.jpg",
        visible: visible,
        left:    left_for(index),
        top:     top_for(index)
      }
    end
  end

  def left_for(index)
    column_index = index % columns
    left_bound + (column_index * width_gap)
  end

  def top_for(index)
    # TODO: do something if last row
    # if row_index == (rows - 1) ...

    row_index = index / columns
    top_bound + (row_index * height_gap)
  end

  def width_gap
    return 0 if columns < 2
    (right_bound - left_bound) / (columns - 1)
  end

  def height_gap
    return 0 if rows < 2
    (bottom_bound - top_bound) / (rows - 1)
  end

  def left_bound
    case columns
    when 1
      50
    when 2
      25
    when 3
      20
    else
      10
    end
  end

  def right_bound
    100 - left_bound
  end

  def top_bound
    case rows
    when 1
      50
    when 2
      25
    when 3
      20
    else
      10
    end
  end

  def bottom_bound
    100 - top_bound
  end

  def columns
    @columns ||= count_mapping[visible_count][0]
  end

  def rows
    @rows ||= count_mapping[visible_count][1]
  end

  def visible_count
    @visible_count ||= game.possible_ids.count
  end

  def count_mapping
    {
      1 =>  [1,1],
      2 =>  [2,1],
      3 =>  [2,2],
      4 =>  [2,2],
      5 =>  [3,2],
      6 =>  [3,2],
      7 =>  [3,3],
      8 =>  [3,3],
      9 =>  [3,3],
      10 => [4,3],
      11 => [4,3],
      12 => [4,3],
      13 => [5,3],
      14 => [4,4],
      15 => [4,4],
      16 => [4,4],
      17 => [5,4],
      18 => [5,4],
      19 => [5,4],
      20 => [5,4],
      21 => [6,4],
      22 => [6,4],
      23 => [6,4],
      24 => [6,4],
      25 => [5,5],
      26 => [6,5],
      27 => [6,5],
      28 => [6,5],
      29 => [6,5],
      30 => [6,5],
      31 => [7,5],
      32 => [7,5],
      33 => [7,5],
      34 => [7,5],
      35 => [7,5],
      36 => [8,5],
      37 => [8,5],
      38 => [7,6],
      39 => [7,6],
      40 => [7,6],
      41 => [7,6],
      42 => [7,6],
      43 => [8,6],
      44 => [8,6],
      45 => [8,6],
      46 => [8,6],
      47 => [8,6],
      48 => [8,6],
      49 => [9,6],
      50 => [9,6],
      51 => [9,6],
      52 => [9,6],
      53 => [9,6],
      54 => [9,6],
      55 => [8,7],
      56 => [8,7],
      57 => [9,7],
      58 => [9,7],
      59 => [9,7],
      60 => [9,7],
      61 => [9,7],
      62 => [9,7],
      63 => [9,7],
      64 => [10,7],
      65 => [10,7],
      66 => [10,7],
      67 => [10,7],
      68 => [10,7],
      69 => [10,7],
      70 => [10,7]
    }
  end
end
