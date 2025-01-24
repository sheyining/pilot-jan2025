// =======================
// STATIC STRUCTURE
// =======================

sig SocialNetwork {
  all_users: set User,
  all_photos: set Photo,
  all_comments: set Comment,
  all_contents: set Content,
  friends: User -> User,
  user_content_map : User -> Content,
  content_tag_map : Content -> User,
  content_comment_map : Content -> Comment,
} {
  all_contents = all_photos + all_comments
}

sig User {}

abstract sig Content {}
sig Photo extends Content {}
sig Comment extends Content {}

// =======================
// INVARIANTS
// =======================

pred wellformedness_invariant [s: SocialNetwork] {
  s.friends in s.all_users -> s.all_users
  s.user_content_map in s.all_users -> s.all_contents
  s.content_tag_map in s.all_contents -> s.all_users
  s.content_comment_map in s.all_contents -> s.all_comments
}

pred friendship_invariant [s: SocialNetwork] {
  // symmetry
  s.friends = ~(s.friends)
  // no self friendship
  all u: s.all_users | u -> u not in s.friends
}

pred content_invariant [s: SocialNetwork] {
  // every content belongs to exactly one user
  s.user_content_map in s.all_users one -> s.all_contents
}

pred tagging_invariant [s: SocialNetwork] {
  // can only tag friends
  all u1, u2 : s.all_users, c: s.all_contents | 
    (u1 -> c) in s.user_content_map and (c -> u2) in s.content_tag_map implies (u1 -> u2) in s.friends

  // no dangling tags
  no c: s.all_contents | no (s.user_content_map).c and some c.(s.content_tag_map)
}

pred comment_invariant [s: SocialNetwork] {
  // every comment points to exactly one content
  s.content_comment_map in s.all_contents one -> s.all_comments
  
  // no loops
  all c: s.all_contents | (c -> c) not in ^(s.content_comment_map)

  // only allow friends or oneself to comment on contents
  all u1, u2 : s.all_users, t: s.all_contents, c: s.all_comments |
    (u1 -> c) in s.user_content_map and (u2 -> t) in s.user_content_map and (t -> c) in s.content_comment_map implies
    (u1 -> u2) in s.friends or u1 = u2
}

pred invariant [s: SocialNetwork] {
  wellformedness_invariant[s]
  friendship_invariant[s]
  content_invariant[s]
  comment_invariant[s]
  tagging_invariant[s]
}


// =======================
// BUGGY OPERATION
// =======================

pred removeFriend [net0, net1: SocialNetwork, u1: User, u2: User] {
  u1 in net0.all_users
  u2 in net0.all_users
  u1 -> u2 in net0.friends

  net1.all_users = net0.all_users
  net1.all_photos = net0.all_photos
  net1.friends = net0.friends - (u1 -> u2) - (u2 -> u1)
  net1.all_comments = net0.all_comments
  net1.user_content_map = net0.user_content_map
  net1.content_comment_map = net0.content_comment_map
  net1.content_tag_map = net0.content_tag_map - u2.(net0.user_content_map) -> u1 - u1.(net0.user_content_map) -> u2
}
