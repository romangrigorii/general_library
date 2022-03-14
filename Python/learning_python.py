### this library includes all of the code I have written on the course of learning more about Python and its many functionaltities
# import numpy as np
# helper functions and classes
class ListNode():
    def __init__(self, val = 0, next = None):
        self.val = val
        self.next = next

def printLN(lnode):
    # prints out a linked list
    l = []
    while lnode:
        l.append(lnode.val)
        lnode = lnode.next
    print(l)

def print2D(mat):
    for l in mat:
        print(l)
        print('\n')
    print('--------------------------------------------\n')
# ************************** LIST OPERATIONS ***********************************

def removeElement(nums,val):
    # returns the length of a list given that all instances of 'val' are removed from 'nums'
    l = 0
    r = len(nums)
    while l<r:
        tl = l
        while tl<r and nums[tl] == val:
            tl+=1
            r-=1
        if tl>l:
            nums[l:] = nums[tl:] + nums[l:tl]
        else:
            l+=1
    return l

def mergeTwoLists(list1,list2):
    # merges two linked lists in order of increasing element values
    sorted = ListNode()
    temp = sorted
    while list1 or list2:
        temp.next = ListNode()
        temp = temp.next
        if list1 and (not list2 or list1.val<=list2.val):
            temp.val = list1.val
            list1 = list1.next
        elif list2 and (not list1 or list2.val<=list1.val):
            temp.val = list2.val
            list2 = list2.next
    return sorted.next

def twoSum(nums,target):
    # given a list of numbers 'nums', finds all pairs of numbers that add up to 'target', without repeats in the pairs
    out = []
    dict = {}
    for i,u in enumerate(nums):
        if u in dict:
            out+= [[nums[dict[u]],u]]
        else:
            dict[target-u] = i
    return out

def threeSumClosest(nums,target):
    # given the list 'nums', find the triplet that sums to value closest to 'target' without repeats
    nums.sort()
    D, out = 10000, []
    for i in range(len(nums)-2):
        l = i + 1
        r = len(nums) - 1
        while l<r:
            cs = nums[i] + nums[l] + nums[r]
            if abs(target-cs)<D:
                D = abs(target-cs)
                out = [nums[i],nums[l],nums[r]]
            if cs<target:
                l+=1
            elif cs>target:
                r-=1
            else:
                break
    return sum(out)

def threeSum(nums,target):
    # given the list 'nums', finds all triplets of numbers that add up to target, without repeats
    nums.sort()
    out = []
    for i in range(len(nums)-2):
        if i>0 and nums[i] == nums[i-1]:
            continue
        l = i+1
        r = len(nums)-1
        while l<r:
            cs = nums[i] + nums[l] + nums[r];
            if cs<target:
                l+=1
            elif cs>target:
                r-=1
            else:
                out += [[nums[i],nums[l],nums[r]]]
                while l<r and nums[l] == nums[l+1]:
                    l+=1
                while l<r and nums[r] == nums[r-1]:
                    r-=1
                l+=1
                r-=1
    return out

def fourSum(nums,target):
    # given list 'nums' find all qudruplets that add up to target without repeats
    nums.sort()
    out = []
    for i in range(len(nums)-3):
        if i>0 and nums[i]==nums[i-1]:
            continue
        for ii in range(i+1,len(nums)-2):
            if ii>i+1 and nums[ii]==nums[ii-1]:
                continue
            l = ii+1
            r = len(nums)-1
            while l<r:
                cs = nums[i] + nums[ii] + nums[l] + nums[r];
                if cs<target:
                    l+=1
                elif cs>target:
                    r-=1
                else:
                    out += [[nums[i],nums[ii],nums[l],nums[r]]]
                    while l<r and nums[l] == nums[l+1]:
                        l+=1
                    while l<r and nums[r] == nums[r-1]:
                        r-=1
                    l+=1
                    r-=1
    return out

def removeNthFromEnd(head, n):
    # removes n-th element from the end of a linked list
    listout = ListNode();
    temp = listout
    def lenlist(listq):
        l = 0
        while listq:
            l+=1
            listq = listq.next
        return l
    lenl = lenlist(head)
    curnode = 0
    while head:
        if (lenl - n) != curnode:
            temp.next = ListNode()
            temp = temp.next
            temp.val = head.val
        head = head.next
        curnode+=1
    return listout.next

#******************************** SUDOKU ***************************************

def isValidSudoku(board):
    # given board checks if the board solution is valid by checking for row, column, and square diplicates
    for x in range(9):
        out = ''
        for y in range(9):
            if board[y][x] in out:
                return False
            else:
                if board[y][x] != '.' and board[y][x] != ',':
                    out += board[y][x]
    for y in range(9):
        out = ''
        for x in range(9):
            if board[y][x] in out:
                return False
            else:
                if board[y][x] != '.' and board[y][x] != ',':
                    out += board[y][x]
    for x in range(3):
        for y in range(3):
            out = ''
            for xx in range(x*3,(x+1)*3):
                for yy in range(y*3,(y+1)*3):
                    if board[yy][xx] in out:
                        return False
                    else:
                        if board[yy][xx] != '.' and board[yy][xx] != ',':
                            out += board[yy][xx]
    return True

#************************ STRING OPERATIONS ************************************
def strStr(haystack,needle):
    # checks if string 'needle' is in the string 'haystack' and returns the index of first element in haystack that matches haystack, otherwise returns -1
    if len(needle)==0:
        return 0
    for i in range(len(haystack)-len(needle)+1):
        if haystack[i:i+len(needle)] == needle:
            return i
    return -1

def isValid(s):
    # given a list of square, round, and curle parantheses checks if they are properly temrinated within a string
    pset = {}
    pset['('] = -1
    pset['{'] = -2
    pset['['] = -3
    pset[')'] = 1
    pset['}'] = 2
    pset[']'] = 3
    l = 0
    r = 1
    while l >-1 and r<len(s):
        if pset[s[l]]<0:
            if pset[s[r]]>0:
                if pset[s[l]] + pset[s[r]] == 0:
                    s = s[:l] + s[r+1:]
                    l -= 1
                    r = l + 1
                    if l == -1:
                        l = r
                        r += 1
                    elif r == len(s):
                        r = l
                        l -= 1
                else:
                    return False
            else:
                l+=1
                r+=1
        else:
            if pset[s[r]]<0:
                r-=1
                l-=1
            else:
                return False
    return len(s) == 0

#****************************** MATH OPERATIONS *******************************

def divide(dividend,divisor):
    # divides dividend by diviser evenly by rounding
    ispos = (dividend>0)==(divisor>0)
    dividend, divisor = abs(dividend), abs(divisor)
    remaining = 0
    while dividend>=divisor:
        divisor_i, i = divisor, 1
        while dividend>=divisor_i:
            dividend -= divisor_i
            divisor_i*=2
            remaining += i
            i*=2
    if not ispos:
        remaining *= -1
    return (max(min(remaining,2147483647),-2147483648))

def myPow(x,n):
    # returns the power of 'x' to 'n'
    ispos, n = n > 0, abs(n)
    res = 1
    while n != 0:
        mul = x
        tempn = 1
        while n>(2*tempn):
            mul*=mul
            tempn<<=1
        res*= mul
        n -= tempn

    if ispos:
        return res
    return 1/res

def mySqrt(x):
    # return the rounded down square root of integer 'x'
    res = 1
    while x>>1 > 1:
        res+=1
        x>>=1
    return res

## IN PROGRESS

def longestValidParentheses(s):
    # given a list of square, round, and curly parantheses returns the length of longest string of correctly placed parenthises 
    pset = {}
    pset['('] = -1
    pset['{'] = -2
    pset['['] = -3
    pset[')'] = 1
    pset['}'] = 2
    pset[']'] = 3
    l = 0
    r = 1
    L = 0 # longest length recorded
    cL = 0 # longer length so far
    while l >-1 and r<len(s):
        while pset[s[l]]>0 and pset[s[r]]<0:
            if pset[s[l]] + pset[s[r]] == 0:
                cL+=2
                if cL>L:
                    L = cL
                l -= 1
                r += 1
            else:
                l =  r
                r += 1
        cL = 0
    return L

def solveSudoku(board):
    # given a partically filled sudoku board, solves it
    board_copy = board.copy()
    sols = [[],[],[],[],[],[],[],[],[]]
    needed = [[],[],[]]
    empty = 0
    for x in range(9):
        for y in range(9):
            if board[x][y] == '.':
                list_temp = []
                list_temp += board[x][:]
                list_temp += board[:][y]
                q = int(x/3)*3;
                list_temp += board[q][int(y/3)*3:(int(y/3)*3)+3]
                list_temp += board[q+1][int(y/3)*3:(int(y/3)*3)+3]
                list_temp += board[q+2][int(y/3)*3:(int(y/3)*3)+3]
                k = list(set(list_temp))
                k.remove('.')
                k = [int(u) for u in k]
                u = [1,2,3,4,5,6,7,8,9]
                for j in k:
                    u.remove(j)
                sols[x] += [u]
                empty += 1
            else:
                sols[x] += [[]]
    for x in range(3):
        for y in range(3):
            list_temp = []
            list_temp += board[x][y*3:y*3+3]
            k = list(set(list_temp))
            if '.' in k:
                k.remove('.')
            k = [int(u) for u in k]
            u = [1,2,3,4,5,6,7,8,9]
            for j in k:
                u.remove(j)
            needed[x]+=[u]
    print(needed)

    while empty>0:
        # print2D(board_copy)
        for x in range(9):
            for y in range(9):
                if len(sols[x][y]) == 1:
                    for xx in range(int(x/3)*3,(int(x/3)*3)+3):
                        for yy in range(int(y/3)*3,(int(y/3)*3)+3):
                            if len(sols[xx][yy]) > 0 and x!=xx and y!=yy and sols[x][y][0] in sols[xx][yy]:
                                sols[xx][yy].remove(sols[x][y][0])
                    for yy in range(9):
                        if yy != y and len(sols[x][yy]) > 0 and sols[x][y][0] in sols[x][yy]:
                            sols[x][yy].remove(sols[x][y][0])
                    for xx in range(9):
                        if xx != x and len(sols[xx][y]) > 0 and sols[x][y][0] in sols[xx][y]:
                            sols[xx][y].remove(sols[x][y][0])
                    board_copy[x][y] = str(sols[x][y][0])
                    sols[x][y] = []
                    empty -= 1
    print(board_copy)

def nextPermutation(nums): # not complete
    i = len(nums)-1
    while i > 0:
        if nums[i]>nums[i-1]:
            temp = nums[i]
            nums[i] = nums[i-1]
            nums[i-1] = temp
            i = 0
        i-=1
    if i == 0:
        nums.reverse()
    return nums


def isMatch(s,p): #not finished
    si = 0
    pi = 0
    flag  = 0
    while pi < len(p):
        if p[pi] == '.':
            flag = 1
            pi+=1
        elif p[k] == '*':
            if flag == 1:
                return True
            else:
                if k == 0:
                    return False
                else:
                    if s[k] == p[k-1]:
                        k+=1
        else:
            flag = 0
            if s[k] == p[k]:
                k+=1
            elif p[k+1] != '*':
                    return False
    return True

def generateParenthesis(n): # completed but no accepted by the program
    if n == 1:
        return ['()']
    else:
        p  = generateParenthesis(n-1);
        out = [];
        for i in range(len(p)):
            if i == 0:
                out += ['()' + p[i],'(' + p[i] + ')']
            else:
                out += ['(' + p[i] + ')','()' + p[i], p[i] + '()']
        return out

def isin(str1,str2):
    for i in str1:
        if i not in str2:
            return False
    return True


def search(nums,target): # not complete
    i = -1
    while len(nums)>1:
        L = len(nums)
        Li  = int(L/2)
        print(nums)
        print(Li)
        if nums[0]<nums[Li-1]:
            if (nums[0]<=target and nums[Li-1]>=target) or (nums[0]>=target and nums[Li-1]<=target):
                nums = nums[0:Li]
                continue
        else:
            nums = nums[0:Li]
            continue
        if nums[Li]<nums[L-1]:
            if (nums[Li]<=target and nums[L-1]>=target) or (nums[Li]>=target and nums[L-1]<=target):
                i+= Li + 1
                nums = nums[Li:L]
                continue
        else:
            i+= Li + 1
            nums = nums[Li:L]
            continue
    if i<0:
        return i
    return i + 1
