require 'byebug'

class StringSearch
  attr_reader :string, :search_string, :offset_table

  def initialize(vars)
    @string = vars[:string]
    @search_string = vars[:search_string]
    @offset_table = [-1]
  end

  def fill_table
    first_chr = @search_string[0]
    iterator = 1

    while iterator < @search_string.length
      @offset_table.push(0)

      if @search_string[iterator] == first_chr
        pre_iter = 1
        iterator += 1

        while @search_string[iterator] == @search_string[pre_iter]
          @offset_table.push(pre_iter)
          iterator += 1
          pre_iter += 1
        end

        @offset_table.push(pre_iter)
      end

      iterator += 1
    end
  end

  def find_substring
    start = 0

    while start < @string.length - @search_string.length
      if @string[start] == @search_string[0]
        sub_start = 0

        while @string[start] == @search_string[sub_start]
          return true if sub_start == @search_string.length - 1
          start += 1
          sub_start += 1

          if @string[start] != @search_string[sub_start]
            sub_start = @offset_table[sub_start]
          end
        end

      else
        start += 1
      end

    end

    false
  end

end
