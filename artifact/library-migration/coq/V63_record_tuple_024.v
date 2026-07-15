(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_024.
Record point_24 := mkPoint_24 { x_24 : nat; y_24 : nat }.

Definition to_pair_24 (p : point_24) : nat * nat := (x_24 p, y_24 p).
Definition from_pair_24 (q : nat * nat) : point_24 := mkPoint_24 (fst q) (snd q).
Definition weight_point_24 (p : point_24) : nat := x_24 p + y_24 p.
Definition weight_pair_24 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_24 : forall p : point_24, from_pair_24 (to_pair_24 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_24 : forall q : nat * nat, to_pair_24 (from_pair_24 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_24 : forall p : point_24, weight_pair_24 (to_pair_24 p) = weight_point_24 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_024.

