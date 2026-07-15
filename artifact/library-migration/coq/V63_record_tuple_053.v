(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_053.
Record point_53 := mkPoint_53 { x_53 : nat; y_53 : nat }.

Definition to_pair_53 (p : point_53) : nat * nat := (x_53 p, y_53 p).
Definition from_pair_53 (q : nat * nat) : point_53 := mkPoint_53 (fst q) (snd q).
Definition weight_point_53 (p : point_53) : nat := x_53 p + y_53 p.
Definition weight_pair_53 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_53 : forall p : point_53, from_pair_53 (to_pair_53 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_53 : forall q : nat * nat, to_pair_53 (from_pair_53 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_53 : forall p : point_53, weight_pair_53 (to_pair_53 p) = weight_point_53 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_053.

