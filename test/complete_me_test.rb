require "minitest"
require "minitest/emoji"
require "minitest/autorun"
require "../../complete_me/lib/complete_me"

class CompleteMeTest
  attr_reader :cm
  def setup
    @cm = CompleteMe.new
  end

  def test_starting_count
    assert_equal 0, cm.count
  end

  def test_inserts_single_word
    cm.insert("pizza")
    assert_equal 1, cm.count
  end

  def test_inserts_multiple_words
    cm.populate("pizza\ndog\ncat")
    assert_equal 3, cm.count
  end

  def test_counts_inserted_words
    insert_words(["pizza", "aardvark", "zombies", "a", "xylophones"])
    assert_equal 5, cm.count
  end

  def test_suggests_off_of_small_dataset
    insert_words(["pizza", "aardvark", "zombies", "a", "xylophones"])
    assert_equal ["pizza"], cm.suggest("p")
    assert_equal ["pizza"], cm.suggest("piz")
    assert_equal ["zombies"], cm.suggest("zo")
    assert_equal ["a", "aardvark"], cm.suggest("a")
    assert_equal ["aardvark"], cm.suggest("aa")
  end

  def test_inserts_medium_dataset
    cm.populate(medium_word_list)
    assert_equal medium_word_list.split("\n").count, cm.count
  end

  def test_suggests_off_of_medium_dataset
    cm.populate(medium_word_list)
    assert_equal ["williwaw", "wizardly"], cm.suggest("wi")
  end

  def test_selects_off_of_medium_dataset
  end

  def test_subsequent_suggestions_account_for_selections
  end

  def test_inserts_large_dataset
  end

  def test_integration_test_over_large_dataset
  end

  def insert_words(words)
    cm.populate(words.join("\n"))
  end

  def medium_word_list
    File.read("./test/medium.txt")
  end
end
