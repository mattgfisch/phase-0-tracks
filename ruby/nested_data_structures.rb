
#
#
# Nested Data Structure
#
#
fleet = [
  airplane1 = {
    row1: side = {
        left: seat_occupied = {
            a: true,
            b: false,
          },
        right: seat_occupied = {
            c: true,
            d: true,
          },  
      }, 
    row2: side = {
        left: seat_occupied = {
            a: false,
            b: false,
          },
        right: seat_occupied = {
            c: false,
            d: true,
          },
      },
    row3: side = {
        left: seat_occupied = {
            a: true,
            b: true,
          },
        right: seat_occupied = {
            c: true,
            d: true,
          },
      },
    row4: side = {
        left: seat_occupied = {
            a: false,
            b: false,
          },
        right: seat_occupied = {
            c: false,
            d: true,
          },
      },
    row5: side = {
        left: seat_occupied = {
            a: true,
            b: false,
          },
        right: seat_occupied = {
            c: true,
            d: true,
          },
      },
    row6: side = {
        left: seat_occupied = {
            a: true,
            b: true,
          },
        right: seat_occupied = {
            c: false,
            d: false,
          },
      },

  },

  airplane2 = {
    row1: side = {
        left: seat_occupied = {
            a: false,
            b: false,
          },
        right: seat_occupied = {
            c: true,
            d: true,
          },  
      }, 
    row2: side = {
        left: seat_occupied = {
            a: false,
            b: false,
          },
        right: seat_occupied = {
            c: false,
            d: false,
          },
      },
    row3: side = {
        left: seat_occupied = {
            a: true,
            b: true,
          },
        right: seat_occupied = {
            c: true,
            d: true,
          },
      },
    row4: side = {
        left: seat_occupied = {
            a: true,
            b: false,
          },
        right: seat_occupied = {
            c: false,
            d: true,
          },
      },
    row5: side = {
        left: seat_occupied = {
            a: true,
            b: false,
          },
        right: seat_occupied = {
            c: true,
            d: true,
          },
      },
    row6: side = {
        left: seat_occupied = {
            a: true,
            b: true,
          },
        right: seat_occupied = {
            c: true,
            d: false,
          },
      },

  }
]

#
#
# Test statements
#
#


# Prints whether Airplane 1, Row 1, Left Side, Seat A is occupied
p fleet[0][:row1][:left][:a]

# Prints whether Airplane 2, Row 5, Right Side, Seat C is occupied
p fleet[1][:row5][:right][:c]

# Prints hash for Airplane 1
p fleet[0]

# Prints hash for Airplane 2, Row 5
p fleet[1][:row5]

# Changes value for Airplane 1, Row 3, Right Side, Seat D to 'false'
fleet[0][:row3][:right][:d] = false
p fleet[0][:row3][:right][:d]

# Adds and empty hash for Airplane 3 to fleet
fleet.push(airplane3 = {})

# Prints new fleet
p fleet



