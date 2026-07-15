(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_048.
Record point_48 := mkPoint_48 { x_48 : nat; y_48 : nat }.

Definition to_pair_48 (p : point_48) : nat * nat := (x_48 p, y_48 p).
Definition from_pair_48 (q : nat * nat) : point_48 := mkPoint_48 (fst q) (snd q).
Definition weight_point_48 (p : point_48) : nat := x_48 p + y_48 p.
Definition weight_pair_48 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_48 : forall p : point_48, from_pair_48 (to_pair_48 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_48 : forall q : nat * nat, to_pair_48 (from_pair_48 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_48 : forall p : point_48, weight_pair_48 (to_pair_48 p) = weight_point_48 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_048.

