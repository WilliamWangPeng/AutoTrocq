(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_037.
Record point_37 := mkPoint_37 { x_37 : nat; y_37 : nat }.

Definition to_pair_37 (p : point_37) : nat * nat := (x_37 p, y_37 p).
Definition from_pair_37 (q : nat * nat) : point_37 := mkPoint_37 (fst q) (snd q).
Definition weight_point_37 (p : point_37) : nat := x_37 p + y_37 p.
Definition weight_pair_37 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_37 : forall p : point_37, from_pair_37 (to_pair_37 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_37 : forall q : nat * nat, to_pair_37 (from_pair_37 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_37 : forall p : point_37, weight_pair_37 (to_pair_37 p) = weight_point_37 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_037.

