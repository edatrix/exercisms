class Grains

  def square(placement)
    2 ** (placement - 1)
  end

  def total
    square(65) - 1
  end

end
