note
	description: "Tests of {VID_DECLARING_AN_ARRAY}."
	testing: "type/manual"

class
	VID_DECLARING_AN_ARRAY_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	array_tests
			-- `array_tests'
		local
			l_array: ARRAY [STRING]
		do
			create l_array.make_empty
			create l_array.make_filled ("X", 1, 5)
			create l_array.make_from_array (<<"my", "new", "array">>)
			create l_array.make_from_special (<<"another", "way">>)

				-- Add items to an empty array
			create l_array.make_empty
			l_array.grow (3)
			l_array.put ("a", 1)
			l_array.put ("b", 2)
			l_array.put ("c", 3)
			assert_arrays_equal ("abc", <<"a", "b", "c">>, l_array)

				-- Test filled array
			create l_array.make_filled ("X", 1, 5) -- Create an array filled with five "X" items.
			assert_arrays_equal ("abc", <<"X","X","X","X","X">>, l_array) -- Test that theory.
		end

	arrayed_list_tests
			-- `arrayed_list_tests'
		local
			l_array: ARRAYED_LIST [STRING]
		do
			create l_array.make (0) -- empty array (like make_empty above)
			create l_array.make_filled (3) -- 3 null strings
			assert_arrays_equal ("three", <<Void,Void,Void>>, l_array.to_array)
			create l_array.make_from_array (<<"a", "b", "c">>)
			assert_arrays_equal ("three", <<"a", "b", "c">>, l_array.to_array)
		end

	arrayed_stack_tests
			-- `arrayed_stack_tests'
		local
			l_array: ARRAYED_STACK [INTEGER]
		do
			create l_array.make (0)
			l_array.force (1)
			l_array.force (2)
			l_array.force (3)
			assert_integers_equal ("three", 3, l_array.count)
		end

	arrayn_tests
			-- Multidimensional `arrayn_tests'
		local
			l_array: ARRAYN [INTEGER]
		do
			create l_array.make_n_based (<<[1, 3], [1, 3]>>) -- 2-dim array with 3-elements along each dimension
			l_array.put (100, <<2, 2>>) -- put 100 at 2,2 or (x,y)
			assert_integers_equal ("2_2", 100, l_array.item (<<2, 2>>)) -- what value is at x,y or 2,2?
			assert_integers_equal ("2_2_at", 100, l_array @ [2,2]) -- another way to ask the same thing.

			create l_array.make_n_based (<<[1, 4], [1, 100], [1, 10]>>) -- 3D array w/4x100x10 elem's
			l_array.put (1_999, <<3, 40, 4>>) -- put 1,999 at [3,40,4]
			assert_integers_equal ("2_40_4_at", 1_999, l_array @ [3, 40, 4]) -- see if we can get it back.

			create l_array.make_one_based (<<1,2,3,4>>)
			create l_array.make_one_based_filled (<<1,2,3,4>>, 0)
		end

end
