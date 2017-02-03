#
#
#
# Nested Data Structure
#
#
#

airplane = {
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

}

p airplane[:row1][:left][:a]