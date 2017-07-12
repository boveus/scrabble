gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def setup
    @game = Scrabble.new
  end

  def test_score_without_a_multiplier
    assert_equal 8, @game.score("hello")
  end

  def test_score_with_multipliers_no_multipliers
    assert_equal 9, @game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_score_with_double_multipliers
    assert_equal 18, @game.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 58, @game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
