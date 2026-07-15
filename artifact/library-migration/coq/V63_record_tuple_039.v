(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_039.
Record point_39 := mkPoint_39 { x_39 : nat; y_39 : nat }.

Definition to_pair_39 (p : point_39) : nat * nat := (x_39 p, y_39 p).
Definition from_pair_39 (q : nat * nat) : point_39 := mkPoint_39 (fst q) (snd q).
Definition weight_point_39 (p : point_39) : nat := x_39 p + y_39 p.
Definition weight_pair_39 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_39 : forall p : point_39, from_pair_39 (to_pair_39 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_39 : forall q : nat * nat, to_pair_39 (from_pair_39 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_39 : forall p : point_39, weight_pair_39 (to_pair_39 p) = weight_point_39 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_039.

