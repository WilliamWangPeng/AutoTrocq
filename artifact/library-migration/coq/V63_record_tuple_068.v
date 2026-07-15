(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_068.
Record point_68 := mkPoint_68 { x_68 : nat; y_68 : nat }.

Definition to_pair_68 (p : point_68) : nat * nat := (x_68 p, y_68 p).
Definition from_pair_68 (q : nat * nat) : point_68 := mkPoint_68 (fst q) (snd q).
Definition weight_point_68 (p : point_68) : nat := x_68 p + y_68 p.
Definition weight_pair_68 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_68 : forall p : point_68, from_pair_68 (to_pair_68 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_68 : forall q : nat * nat, to_pair_68 (from_pair_68 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_68 : forall p : point_68, weight_pair_68 (to_pair_68 p) = weight_point_68 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_068.

